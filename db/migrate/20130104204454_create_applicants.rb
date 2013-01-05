class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :fname
      t.string :lname
      t.date :date_applied

      t.timestamps
    end
  end
end
