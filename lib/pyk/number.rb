class Pyk::Number
  
  def self.remove_decimal(d)
    d.to_s.gsub(".0", "")
  end
  
  def self.color_amount(d)
    if d < 0
      "<span class='red'>(#{number_to_currency(d, unit: '')})</span>".html_safe
    else
      number_to_currency(d, unit: '')
    end
  end
  
end