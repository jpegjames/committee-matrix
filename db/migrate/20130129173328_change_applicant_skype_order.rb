class ChangeApplicantSkypeOrder < ActiveRecord::Migration
  def change
    remove_column :applicants, :skype_order
    add_column :applicants, :skype_date, :datetime
  end
end
