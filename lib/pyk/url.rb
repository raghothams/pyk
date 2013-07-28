class Pyk::Url
  
  # Standardize how web URLs are presented
  # Pyk::Url.clean(link)
  def self.clean(link)
    link = link.gsub("http://", "")
    link = link.gsub("https://", "")
    link = link.gsub("www.", "")
    return "http://#{link}"
  end
  
end