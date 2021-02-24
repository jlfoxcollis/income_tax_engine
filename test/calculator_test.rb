require 'minitest/autorun'
require './lib/calculator'
# require './lib/generator'
# require './lib/file_reader'
require 'csv'
require 'pry'

class CalculatorTest < Minitest::Test

  def test_it_exists
    income_taxes = Calculator.tax_bracket(9500)

    assert_equal 0, income_taxes
  end

  def test_over_10000
    income_taxes = Calculator.tax_bracket(10500)

    assert_equal 50, income_taxes
  end

  def test_under_20000
    income_taxes = Calculator.tax_bracket(19450)

    assert_equal 945, income_taxes
  end

  def test_over_20000
    income_taxes = Calculator.tax_bracket(25450)

    assert_equal 3090, income_taxes
  end

  def test_over_50000
    income_taxes = Calculator.tax_bracket(95000)

    assert_equal 20500, income_taxes
  end
end