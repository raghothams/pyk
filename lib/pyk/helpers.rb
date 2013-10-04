module Pyk::Helpers
  
  #--------------------------------------------------------------------------------------------------------------
  # GENERIC
  #--------------------------------------------------------------------------------------------------------------
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def dp(email, size=20)
    Pyk::Gravatar.dp(email, size)
  end
  
  def icon_d
    "<span class='glyphicon glyphicon-trash'></span>".html_safe
  end
  
  def r
    "<i class='icon-repeat'></i>".html_safe
  end
  
  #--------------------------------------------------------------------------------------------------------------
  # NUMBERS
  #--------------------------------------------------------------------------------------------------------------
  
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
  
  def stock_market(d)
    if d < 0
      return "<span style='color: red;'><i class='icon-arrow-down'></i></span> #{d}%".html_safe
    elsif d > 0
      return "<span style='color: green;'><i class='icon-arrow-up'></i></span> #{d}%".html_safe
    else
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
  
  #--------------------------------------------------------------------------------------------------------------
  # DATE
  #--------------------------------------------------------------------------------------------------------------
  
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
  
  #--------------------------------------------------------------------------------------------------------------
  # ADDRESS
  #--------------------------------------------------------------------------------------------------------------
  
  def location_summary(u)
    return Pyk::Address.to_s(u)
  end

  def location_summary_short(u)
    return Pyk::Address.gist(u)
  end

  def location_map(u)
    return Pyk::Address.map(u, 300, 95)
  end
  
  #--------------------------------------------------------------------------------------------------------------
  # DEVISE
  #--------------------------------------------------------------------------------------------------------------
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  #DEVISE end

  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
      error_key = 'devise.failure.invalid'
    end

    return "" if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t(error_key, :count    => errors.count,
                                 :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
        
end