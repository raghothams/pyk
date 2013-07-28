class Pyk::Date
  
  #Pyk::Date.start_of_financial_year(d)
  def self.start_of_financial_year(d)
    Date.new((d.to_i - 1), 4, 1).to_time
  end

  #Pyk::Date.end_of_financial_year(d)
  def self.end_of_financial_year(d)
    Date.new(d.to_i, 3, 31).to_time + 86340
  end
  
  #Pyk::Date.end_of_month(month, year)
  def self.end_of_month(month, year)
    Date.new(year, month, -1).to_time + 86340
  end
  
end