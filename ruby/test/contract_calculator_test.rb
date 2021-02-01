require 'test/unit'
require 'contract_calculator'

class TC_ContractCalculator < Test::Unit::TestCase
  sub_test_case "用意されてないカテゴリの場合" do
    def test_NoMatchingPatternErrorになる
      # given
      price = 100
      category = :powerpoint
      signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00")

      # then
      assert_raises NoMatchingPatternError do
        ContractCalculator.calc(price: price, category: category, signed_on: signed_on)
      end
    end
  end

  sub_test_case "カテゴリがワードプロセッサの場合" do
    def test_全額売上認識される
      # given
      price = 18800
      category = :word_processor
      signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00")

      # when
      actual = ContractCalculator.calc(price: price, category: category, signed_on: signed_on)

      # then
      assert_equal(price, actual[:revenue_recognition])
    end

    def test_契約日が売上認識日となる
      # given
      price = 20000
      category = :word_processor
      signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00")

      # when
      actual = ContractCalculator.calc(price: price, category: category, signed_on: signed_on)

      # then
      assert_equal(signed_on, actual[:revenued_at])
    end
  end

  sub_test_case "カテゴリがスプレッドシートの場合" do
    def test_価格の3分の2が売上認識される
      # given
      price = 3
      category = :spreadsheet
      signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00")

      # and
      expected = 2

      # when
      actual = ContractCalculator.calc(price: price, category: category, signed_on: signed_on)

      # then
      assert_equal(expected, actual[:revenue_recognition])
    end

    def test_契約日から30日後が売上認識日となる
      # given
      price = 27800
      category = :spreadsheet
      signed_on = Time.new(2021, 2, 1, 0, 0, 0, "+09:00")

      # and
      expected = Time.new(2021, 3, 3, 0, 0, 0, "+09:00")

      # when
      actual = ContractCalculator.calc(price: price, category: category, signed_on: signed_on)

      # then
      assert_equal(expected, actual[:revenued_at])
    end

    sub_test_case "価格が3で割り切れない場合" do
      data("MS Excel", [27800, 18534])
      data("三四郎",    [5000, 3334])
      def test_なるべく早いタイミングで大きい金額で集積確認したいため_収益認識に端数をプラスする(data)
        # given
        price, expected = data

        # and
        category = :spreadsheet
        signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00")

        # when
        actual = ContractCalculator.calc(price: price, category: category, signed_on: signed_on)

        # then
        assert_equal(expected, actual[:revenue_recognition])
      end
    end
  end
end
