module AppHelpers
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def d
    "<span style='font-size:13px'><i class='icon-trash'></i></span>".html_safe
  end
  
  def r
    "<i class='icon-repeat'></i>".html_safe
  end
  
end