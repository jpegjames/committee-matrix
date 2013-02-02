class CreateSkypeInterviewRecordings < ActiveRecord::Migration
  def change
    create_table :skype_interview_recordings do |t|
      t.references :applicant

      t.timestamps
    end
    add_index :skype_interview_recordings, :applicant_id
  end
end
