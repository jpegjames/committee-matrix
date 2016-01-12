class Position < ActiveRecord::Base
  has_many :applicants
  
  attr_accessible :title

  def to_s
    self.title
  end

  def name
    self.title
  end
end
