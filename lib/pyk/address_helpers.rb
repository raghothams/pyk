module Pyk::AddressHelpers
  
  def location_summary(u)
    return Pyk::Address.to_s(u)
  end

  def location_summary_short(u)
    return Pyk::Address.gist(u)
  end

  def location_map(u)
    return Pyk::Address.map(u, 300, 95)
  end
        
end