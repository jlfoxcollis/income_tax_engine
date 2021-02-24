require 'minitest/autorun'
require './lib/calculator'
require './lib/generator'
require './lib/file_reader'
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

  def test_it_can_read_and_write_csv_files
    taxable_income = FileReader.read("income")
    taxes = Calculator.calculate_taxes("tax_brackets", taxable_income)

    taxable_income.first[1]
    expected = {"1" => 50.0}
    assert_equal expected, taxes.first
    assert_equal 3150.0, taxes[1].first[1]
    assert_equal 1000.0, taxes[2].first[1]
    assert_equal 1400.0, taxes[3].first[1]
    assert_equal 16500.0, taxes[4].first[1]
    assert_equal 50.0, taxes[5].first[1]
    assert_equal 0.0, taxes[6].first[1]
    assert_equal 500.0, taxes[7].first[1]
  end
end