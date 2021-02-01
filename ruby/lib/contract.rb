class Contract
  attr_reader :product, :signed_on, :revenue, :revenue_recognition, :revenued_at

  def initialize(product:, signed_on:, revenue:, revenue_recognition:, revenued_at:)
    @product = product
    @signed_on = signed_on
    @revenue = revenue
    @revenue_recognition = revenue_recognition
    @revenued_at = revenued_at
  end
end
