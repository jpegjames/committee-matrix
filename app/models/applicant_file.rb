class ApplicantFile < ActiveRecord::Base
  belongs_to :applicant
  # attr_accessible :title, :body
  
  attr_accessible :attachment
  has_attached_file :attachment
end
