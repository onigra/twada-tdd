require 'test/unit'
require 'calculator/spreadsheet/revenue_recognition'

class Calculator::Spreadsheet::TC_RevenueRecognition < Test::Unit::TestCase
  sub_test_case "商品価格が3で割り切れる場合" do
    data("3の倍数の最小の値", [3, 2])
    data("3の倍数の2倍の値", [6, 4])
    data("3の倍数の3倍の値", [9, 6])
    def test_収益価格は3分の2となる(data)
      # given
      amount, expected = data

      # when
      actual = Calculator::Spreadsheet::RevenueRecognition.calc(amount)

      # then
      assert_equal(expected, actual)
    end
  end

  sub_test_case "商品価格が3で割り切れない場合" do
    data("MS Excel", [27800, 18534])
    data("三四郎",    [5000, 3334])
    def test_なるべく早いタイミングで大きい金額で集積確認したいため_収益認識に端数をプラスする(data)
      # given
      amount, expected = data

      # when
      actual = Calculator::Spreadsheet::RevenueRecognition.calc(amount)

      # then
      assert_equal(expected, actual)
    end
  end

  sub_test_case "商品価格が3未満の場合" do
    data("0", [0])
    data("1", [1])
    data("2", [2])
    def test_仕様が決まってないので引数エラーとする(data)
      # given
      amount, _ = data

      # then
      assert_raises ArgumentError do
        Calculator::Spreadsheet::RevenueRecognition.calc(amount)
      end
    end
  end
end
