class Pyk::Gravatar
  
  #Pyk::Gravatar.dp(email, size)
  def self.dp(email, size=20)
    email = email.blank? ? "" : email
    identifier = Digest::MD5.hexdigest(email.downcase)
    return "http://gravatar.com/avatar/#{identifier}.png?s=#{size}"    
  end
  
  #Pyk::Gravatar.profile(email)
  def self.profile(email)
    email = email.blank? ? "" : email
    identifier = Digest::MD5.hexdigest(email.downcase)
    return "http://gravatar.com/#{identifier}"
  end
  
end