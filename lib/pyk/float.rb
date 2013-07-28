class Pyk::Float
  
  # Remove the unnecessary .0 that gets added to floated strings
  def self.clean(f)
    f = f.to_s
    return f.index(".0").blank? ? f : f[0, f.index(".0")]
  end
  
  def remove_decimal(d)
    d.to_s.gsub(".0", "")
  end
  
end