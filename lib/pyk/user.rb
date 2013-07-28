class Pyk::User
  
  #Pyk::User.is_admin?(current_user.email)
  def self.is_admin?(email)
    (email == "rp@pykih.com" or email == "gs@pykih.com") ? true : false
  end
  
end