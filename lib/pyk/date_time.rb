class Pyk::DateTime
  
  #Pyk::Date.get_start_date_from_tag(tag, default_year=nil, default_month=nil)
  def self.get_start_date_from_tag(tag, default_year=nil, default_month=nil)
    if tag == "this_month"
      return Date.new(Time.now.strftime("%Y").to_i, Time.now.strftime("%m").to_i, 1).to_time
    elsif tag == "last_30"
      return (Date.today - 30).to_time
    elsif tag == "last_month"
      lm = (Time.now - 1.month)
      sdt = Date.new(lm.strftime("%Y").to_i, lm.strftime("%m").to_i, 1)
      return Date.new(lm.strftime("%Y").to_i, lm.strftime("%m").to_i, 1).to_time
    elsif tag == "last_7"
      return (Date.today - 7).to_time
    else
      return Date.new(default_year, default_month, 1).to_time
    end
  end
  
  #Pyk::Date.get_end_date_from_tag(tag)
  def self.get_end_date_from_tag(tag)
    if tag == "last_month"
      lm = (Time.now - 1.month)
      sdt = Date.new(lm.strftime("%Y").to_i, lm.strftime("%m").to_i, 1)
      ed = (sdt + 1.month - 1.day).to_time
    else #if tag == "this_month" or tag == "last_30" or tag == "last_7"
      return Time.now
    end
  end
  
end