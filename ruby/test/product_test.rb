require 'test/unit'
require 'product'

class TC_Product < Test::Unit::TestCase
  sub_test_case "商品カテゴリがワードプロセッサの場合" do
    def test_名前と価格とカテゴリをもって商品が作成できる
      # given
      name     = "MS Word"
      price    = 18800
      category = "word_processor"

      # when
      product = Product.new(name: name, price: price, category: category)

      # then
      assert_equal(product.name, name)
      assert_equal(product.price, price)
      assert_equal(product.category, category)
    end
  end

  sub_test_case "商品カテゴリがスプレッドシートの場合" do
    def test_名前と価格とカテゴリをもって商品が作成できる
      # given
      name     = "三四郎"
      price    = 5000
      category = "spreadsheet"

      # when
      product = Product.new(name: name, price: price, category: category)

      # then
      assert_equal(product.name, name)
      assert_equal(product.price, price)
      assert_equal(product.category, category)
    end
  end
end
