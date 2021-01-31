require 'test/unit'
require 'sample'

class TC_Sample < Test::Unit::TestCase
  def test_say
    # given
    obj = Sample.new

    # when
    actual = obj.say

    # then
    assert_equal('Hello TDD BootCamp!', actual)
  end
end
