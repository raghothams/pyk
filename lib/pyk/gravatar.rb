class Pyk::Gravatar
  
  #Pyk::Gravatar.dp(email, size)
  def self.dp(email, size=20)
    identifier = Digest::MD5.hexdigest((email.blank? ? "" : email).downcase)
    "http://gravatar.com/avatar/#{identifier}.png?s=#{size}"    
  end
  
  #Pyk::Gravatar.profile(email)
  def self.profile(email)
    identifier = Digest::MD5.hexdigest((email.blank? ? "" : email).downcase)
    "http://gravatar.com/#{identifier}"
  end
  
end