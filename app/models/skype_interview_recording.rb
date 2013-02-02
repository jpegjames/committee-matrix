class SkypeInterviewRecording < ActiveRecord::Base
  belongs_to :applicant
  attr_accessible :video, :applicant_id
  has_attached_file :video
end
