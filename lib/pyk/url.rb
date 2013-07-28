class Pyk::Url
  
  # Standardize how web URLs are presented
  def self.clean(link)
    link = link.gsub("http://", "")
    link = link.gsub("https://", "")
    link = link.gsub("www.", "")
    return "http://#{link}"
  end
  
  
  # Remove the unnecessary .0 that gets added to floated strings
  def self.floated_string(f)
    f = f.to_s
    return f.index(".0").nil? ? f : f[0, f.index(".0")]
  end
  
end