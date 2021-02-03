require_relative "./contract"
require_relative "./contract_calculator"

class ContractService
  def self.sign(product:, signed_on:)
    obj = ContractCalculator.calc(price: product.price, category: product.category.name, signed_on: signed_on)

    return Contract.new(
      product: product,
      signed_on: signed_on,
      revenue: product.price,
      revenue_recognition: obj[:revenue_recognition],
      revenued_at: obj[:revenued_at],
    )
  end
end
