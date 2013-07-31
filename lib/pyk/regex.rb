class Pyk::Regex
  
  #Pyk::Regex::EMAIL
  EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  # May be future can be --- https://github.com/phatworx/devise_security_extension
  #Pyk::Regex::PASSWORD
  PASSWORD = /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,}$/
  
  #Pyk::Regex::URL
  URL = URI::regexp(%w(http https))
  
end