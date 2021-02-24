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
  end
end