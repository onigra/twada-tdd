require 'test/unit'
require 'contract_service'

class TC_ContractService < Test::Unit::TestCase
  sub_test_case "商品カテゴリがワードプロセッサの場合" do
    def test_契約日に全額収益認識できる
      # given
      name     = "MS Word"
      price    = 18800
      category = "word_processor"
      product = Product.new(name: name, price: price, category: category)

      # and
      signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00") 

      # when
      contract = ContractService.sign(product: product, signed_on: signed_on)

      # then
      assert_equal(contract.revenue, 18800)
      assert_equal(contract.revenue_recognition, 18800)
    end

    def test_契約日が収益認識日となる
      # given
      name     = "MS Word"
      price    = 18800
      category = "word_processor"
      product = Product.new(name: name, price: price, category: category)

      # and
      signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00") 

      # when
      contract = ContractService.sign(product: product, signed_on: signed_on)

      # then
      assert_equal(contract.revenued_at, signed_on)
    end
  end

  sub_test_case "商品カテゴリがスプレッドシートの場合" do
    def test_契約日に売上の3分の2を収益認識する
      # given
      name     = "三四郎"
      price    = 5000
      category = "spreadsheet"
      product = Product.new(name: name, price: price, category: category)

      # and
      signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00") 

      # when
      contract = ContractService.sign(product: product, signed_on: signed_on)

      # then
      assert_equal(contract.revenue, 5000)
      assert_equal(contract.revenue_recognition, 3334)
    end

    def test_契約日から30日後が収益認識日となる
      # given
      name     = "三四郎"
      price    = 5000
      category = "spreadsheet"
      product = Product.new(name: name, price: price, category: category)

      # and
      signed_on = Time.new(2021, 2, 1, 0, 0, 0, "+09:00") 

      # and
      actual = Time.new(2021, 3, 3, 0, 0, 0, "+09:00") 

      # when
      contract = ContractService.sign(product: product, signed_on: signed_on)

      # then
      assert_equal(contract.revenued_at, actual)
    end
  end
end
