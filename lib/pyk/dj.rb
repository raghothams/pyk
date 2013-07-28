class Pyk::Dj
  
  #Pyk::Dj.bug
  def self.bug
    DelayedJob.where("last_error is not null")
  end
  
  #Pyk::Dj.ok
  def self.ok
    DelayedJob.where("last_error is null")
  end
  
  #Pyk::Dj.active
  def self.active
    DelayedJob.where("locked_at is not null")
  end
  
  #Pyk::Dj.bug_count
  def self.bug_count
    DelayedJob.where("last_error is not null").count
  end
  
  #Pyk::Dj.ok_count
  def self.ok_count
    DelayedJob.where("last_error is null").count
  end
  
  #Pyk::Dj.active_count
  def self.active_count
    DelayedJob.where("locked_at is not null").count
  end
  
  #Pyk::Dj.status(d)
  def self.status(d)
    if !d.last_error.blank?
      return "<span class='red'>Error</span>".html_safe
    elsif d.last_error.blank? and d.locked_at.blank?
      return "<span style='color: orange;'>In Queue</span>".html_safe
    elsif d.last_error.blank? and !d.locked_at.blank?
      return "<span class='green'>Running</span>".html_safe
    end
  end
  
end