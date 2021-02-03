require 'test/unit'
require 'calculator/spreadsheet/revenue_date'

class Calculator::Spreadsheet::TC_RevenueDate < Test::Unit::TestCase
  data("2021年2月1日", [Time.new(2021, 2, 1, 0, 0, 0, "+09:00"), Time.new(2021, 3, 3, 0, 0, 0, "+09:00")])
  def test_契約日から30日後が売上認識日となる(data)
    # given
    signed_on, expected = data

    # when
    actual = Calculator::Spreadsheet::RevenueDate.calc(signed_on)

    # then
    assert_equal(expected, actual)
  end
end
