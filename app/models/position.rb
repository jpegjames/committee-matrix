class Position < ActiveRecord::Base
  attr_accessible :title

  def to_s
    self.title
  end

  def name
    self.title
  end
end
