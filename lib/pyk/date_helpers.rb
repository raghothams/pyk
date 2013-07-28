module DateHelpers
  
  def smart_date(i, mode="date")
    if i.blank?
      return "" 
    elsif (i.class.to_s == "Time" or i.class.to_s == "ActiveSupport::TimeWithZone") and mode == "time"
      return i.year == Time.now.year ? i.strftime("%d-%b %H:%M") : i.strftime("%d-%b-%Y %H:%M")
    else
      return i.year == Time.now.year ? i.strftime("%d-%b") : i.strftime("%d-%b-%Y")
    end
  end
  
  def smart_due_date(i)
    if i == nil
      return ""
    elsif i.class.to_s == "Time" or i.class.to_s == "ActiveSupport::TimeWithZone"
      i = i.to_date
    end
    if Date.today == i
      return "<span style=\"background-color:#F7FAB9;padding:0px 2px 0px 2px;\">Today</span>"
    elsif i - Date.today == 1
      return "<span style=\"background-color:#F7FAB9;padding:0px 2px 0px 2px;\">Tomorrow</span>"
    elsif Date.today - i > 0.9
      return "<span style=\"background-color:#FFC7C7;padding:0px 2px 0px 2px;\">" +  smart_date(i) + "</span>"
    elsif Date.today - i < 1
      return "<span style=\"background-color:#D2FFCC;padding:0px 2px 0px 2px;\">" +  smart_date(i) + "</span>"
    end
    return smart_date(i, "date")
  end
  
end