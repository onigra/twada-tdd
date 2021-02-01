require 'test/unit'
require 'category'

class TC_Category < Test::Unit::TestCase
  def test_ワードプロセッサを設定できる
    # given
    name = :word_processor

    # when
    category = Category.new(name: name)

    # then
    assert_equal(name, category.name)
  end

  def test_スプレッドシートを設定できる
    # given
    name = :spreadsheet

    # when
    category = Category.new(name: name)

    # then
    assert_equal(name, category.name)
  end

  def test_それ以外は設定できない
    # given
    name = :powerpoint

    # then
    assert_raises ArgumentError do
      Category.new(name: name)
    end
  end
end
