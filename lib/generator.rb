class Generator
  class << self
    #simple number generator
    def number_generator
      rand(5000000)
    end

    #generate 50 tax brackets
    def generate_brackets
      brackets = []
      x = 10000
      y = 0.00
      5.times do 
        brackets << {x => y}
        x *= 2
        y += 0.05
      end
      25.times do
        brackets << {x => y}
        x *= 1.5
        y += 0.01
      end
      20.times do
        brackets << {x => y}
        x *= 1.5
        y += 0.005
      end
  
      CSV.open("data/extra_brackets.csv", "wb") do |csv|
        csv << ["min_income", "rate"]
        brackets.each do |bracket|
          csv << [bracket.first[0].round(2), bracket.first[1].round(2)]
        end
      end
    end

    #generate 100k sample clients income
    def generate_income
      income = []
      i = 1
      100000.times do 
        income << {i => number_generator}
        i += 1
      end
      FileReader.write("income_100k", income)
    end 
  end
end