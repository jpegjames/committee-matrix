class CreateApplicantFiles < ActiveRecord::Migration
  def change
    create_table :applicant_files do |t|
      t.references :applicant

      t.timestamps
    end
    add_index :applicant_files, :applicant_id
  end
end
