class Pyk::User
  
  def self.is_admin?(email)
    (email == "rp@pykih.com" or email == "gs@pykih.com") ? true : false
  end
  
end