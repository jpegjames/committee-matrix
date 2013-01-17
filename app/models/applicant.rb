class Applicant < ActiveRecord::Base
  has_many :member_responses
  has_many :members, :through => :member_responses
  
  attr_accessible :date_applied, :fname, :lname
  
  def to_s
    self.name
  end
  def name
    self.fname + " " + self.lname
  end
  def on_skype_list?
    if self.skype_list == 3
      return true
    elsif self.skype_list == 1
      return false
    else
      return nil
    end
  end
end
