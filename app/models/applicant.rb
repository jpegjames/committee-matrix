class Applicant < ActiveRecord::Base
  has_many :member_responses
  has_many :members, :through => :member_responses
  has_one :skype_interview_recording
  belongs_to :position

  attr_accessible :date_applied, :fname, :lname, :skype_date, :position_id

  ## Disabling files for Heroku
  # has_many :files, :class_name => 'ApplicantFile'
  # has_many :applicant_files
  # attr_accessible :applicant_files_attributes
  # accepts_nested_attributes_for :applicant_files

  validates_presence_of :fname, :lname, :position_id

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
