class AddAttachmentVideoToSkypeInterviewRecording < ActiveRecord::Migration
  def self.up
    add_column :skype_interview_recordings, :video_file_name, :string
    add_column :skype_interview_recordings, :video_content_type, :string
    add_column :skype_interview_recordings, :video_file_size, :integer
    add_column :skype_interview_recordings, :video_updated_at, :datetime
  end

  def self.down
    remove_column :skype_interview_recordings, :video_file_name
    remove_column :skype_interview_recordings, :video_content_type
    remove_column :skype_interview_recordings, :video_file_size
    remove_column :skype_interview_recordings, :video_updated_at
  end
end
