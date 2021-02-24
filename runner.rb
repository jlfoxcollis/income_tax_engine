require 'pry'
require 'CSV'
require './lib/calculator'
require './lib/file_reader'

#import income from CSV file
# taxable_income = CSV.readlines('data/income.csv', headers: true) do |row|
#   {row[0] => row[1]}
# end

taxable_income = FileReader.read("income")
#iterate through array of incomes and calculate income taxes based on brackets.

taxes = Calculator.calculate_taxes("tax_brackets", taxable_income)
# income_taxes = []
# taxable_income.each do |income|
#   income_taxes << {income[0] => Calculator.taxed_by_bracket(income[1].to_i)}
# end

FileReader.write("income_taxes", taxes)
# CSV.open("data/income_taxes.csv", 'wb') do |csv|
#   csv << ["client", "income_tax"]
#   income_taxes.each do |income_tax|
#     csv <<  [income_tax.first[0], income_tax.first[1]]
#   end
# end