module Pyk::NumberHelpers
  
  def two_decimal_points(ff)
    sprintf("%0.02f", ff)
  end
  
  def remove_decimal(str)
    str = str.to_s
    if str.index(".").present?
      str = str[0..(str.index(".") - 1)]
    end
    str
  end
  
  def n2h(d)
    begin
      return number_to_human(d, significant: false, precision: 1)
    rescue
      return d
    end
  end
  
  def color_amount(d)
    if d < 0
      "<span class='red'>(#{number_to_currency(d, unit: '')})</span>".html_safe
    else
      number_to_currency(d, unit: '')
    end
  end
        
end