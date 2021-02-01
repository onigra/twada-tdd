require 'test/unit'
require 'contract'

class TC_Contract < Test::Unit::TestCase
  def test_商品と契約日と売上と売上認識と売上認識日を持って契約が作成できる
    # given
    name     = "MS Word"
    price    = 18800
    category = "word_processor"
    product = Product.new(name: name, price: price, category: category)

    # and
    signed_on = Time.new(2021, 1, 1, 0, 0, 0, "+09:00")
    revenue = 18800
    revenue_recognition = 18800
    revenued_at = Time.new(2021, 1, 1, 0, 0, 0, "+09:00")

    # when
    contract = Contract.new(
      product: product,
      signed_on: signed_on,
      revenue: revenue,
      revenue_recognition: revenue_recognition,
      revenued_at: revenued_at,
    )

    # then
    assert_equal(contract.product, product)
    assert_equal(contract.signed_on, signed_on)
    assert_equal(contract.revenue, revenue)
    assert_equal(contract.revenue_recognition, revenue_recognition)
    assert_equal(contract.revenued_at, revenued_at)
  end
end
