class Pyk::Api
  
  require 'open-uri'
  require "net/https"
  
  #==========================================================================================
  
  #Pyk::Api.basic_auth(url, user_agent, username, password)
  def self.basic_auth(url, user_agent, username, password)
    Pyk::Api.get(url, user_agent, "basic", username, password)
  end
  
  #Pyk::Api.no_auth(url, user_agent)
  def self.no_auth(url, user_agent)
    Pyk::Api.get(url, user_agent, nil, nil, nil)
  end
  
  #==========================================================================================
  
  #Pyk::Api.json(nestful_response)
  def self.json(nestful_response)
    begin
      if !nestful_response.blank?
        if !nestful_response.body.blank?
          return JSON.parse(nestful_response.body)
        end
      end
      return nil
    rescue
      return nil
    end
  end
  
  #==========================================================================================
  
  private
  
  def self.get(url, user_agent, auth_type=nil, username=nil, password=nil)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    if !url.index("https://").blank?
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    request = Net::HTTP::Get.new(uri.request_uri, {'User-Agent' => user_agent})
    if auth_type.present?
      if auth_type == "basic"
        request.basic_auth username, password
      end
    end
    http.request(request)
  end
  
end