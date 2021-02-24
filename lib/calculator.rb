class Calculator
  class << self

    # basic tax brackets
    # 0-10000 untaxed
    # 10001 - 20000 taxed 10%
    # 20001 - 50000 taxed 20%
    # 50001 - + taxed 30%
    
    # not scalable
    def tax_bracket(income)
      net_income = income
      income_tax = 0
      if net_income < 10000
        income_tax <<  0
      elsif net_income < 20000
        income_tax += ((net_income - 10000) * 0.1)
      elsif net_income < 50000
        income_tax += ((net_income - 20000) * 0.2 + 2000)
      elsif net_income > 50000
        income_tax += ((net_income - 50000) * 0.3 + 7000)
      end
      income_tax
    end

    def tax_brackets(rates)
      brackets = FileReader.read(rates || "tax_brackets")
      brackets.sort {|a, b| a[0].to_i <=> b[0].to_i}
    end

    def calculate_taxes(rates, taxable_income)
      taxable_income.map do |income|
        {income[0] => Calculator.taxed_by_bracket(rates, income[1].to_i)}
      end
    end
    
    def taxed_by_bracket(rates, income)
      income_tax = 0
      taxed_income = 0
      tax_brackets(rates).each do |bracket|
        minimum = bracket[0].to_i
        rate = bracket[1].to_f
        if income > minimum
          income_tax += (minimum - taxed_income) * rate
          taxed_income += (minimum - taxed_income)
        elsif income < minimum
          income_tax += (income - taxed_income) * rate
          taxed_income += (income - taxed_income)
          return income_tax
        end
      end
    end
  end
end