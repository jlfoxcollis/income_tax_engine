class FileReader
  class << self

    #dynamic way to read the income and tax bracket csv
    def read(file_name)
      CSV.readlines("data/#{file_name}.csv", headers: true) do |row|
        {row[0] => row[1]}
      end
    end

    #write new income tax csv
    def write(file_name, income_taxes)
      CSV.open("data/#{file_name}.csv", 'wb') do |csv|
        csv << ["client", "income_tax"]
        income_taxes.each do |income_tax|
          csv <<  [income_tax.first[0], income_tax.first[1]]
        end
      end
    end
  end
end