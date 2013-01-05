class Member < ActiveRecord::Base
  has_many :member_responses
  has_many :applicants, :through => :member_responses
  
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_secure_password
  validates_presence_of :password, :on => :create
end
