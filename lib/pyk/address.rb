class Pyk::Address
  
  #GEMS USED
  require 'carmen'
  include Carmen
  
  def self.country_to_s(country_iso2)
    if !country_iso2.nil?
      cobj = Country.coded(country_iso2)
      if !cobj.blank?
        return cobj.name
      end
    end
    return ""
  end
  
  def self.state_to_s(country_iso2, state_iso2)
    if !country_iso2.nil? and !state_iso2.nil?
      cobj = Country.coded(country_iso2)
      if !cobj.blank?
        sobj = cobj.subregions.coded(state_iso2)
        if !sobj.blank?
          return sobj.name
        end
      end
    end
    return ""
  end
  
  def self.to_s(u)
    str = ""
    str = (u.addressline.blank? ? "" : u.addressline + ", ")
    str = str + (u.city.blank? ? "" : u.city + ", ")
    str = str + (u.zipcode.blank? ? "" : u.zipcode + ", ")
    c = Pyk::Address.country_to_s(u.country_iso2)
    s = Pyk::Address.state_to_s(u.country_iso2, u.subregion_iso2)
    str = str + (s.blank? ? "" : s + ", ")
    str = str + (c.blank? ? "" : c)
    return str
  end
  
  def self.gist(u)
    str = ""
    str = (u.city.blank? ? "" : u.city + ", ")
    c = Pyk::Address.country_to_s(u.country_iso2)
    s = Pyk::Address.state_to_s(u.country_iso2, u.subregion_iso2)
    str = str + (s.blank? ? "" : s + ", ")
    str = str + (c.blank? ? "" : c)
    return str
  end
  
  def self.gist_no_city(u)
    str = ""
    c = Pyk::Address.country_to_s(u.country_iso2)
    s = Pyk::Address.state_to_s(u.country_iso2, u.subregion_iso2)
    str = str + (s.blank? ? "" : s + ", ")
    str = str + (c.blank? ? "" : c)
    return str
  end
  
  #Google Maps Static API
  
  def self.map(u, h=300, w=95)
    str = ""
    str = (u.city.blank? ? "" : u.city + "++")
    c = Pyk::Address.country_to_s(u.country_iso2)
    str = str + (c.blank? ? "" : c)
    return str == "" ? nil : "https://maps.google.com/maps/api/staticmap?visible=#{str}&size=#{h.to_s}x#{w.to_s}&sensor=false&maptype=terrain&markers=size:small|color:red|#{str}"
  end
  
end