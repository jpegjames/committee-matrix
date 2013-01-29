class ApplicantSkypeOrder < ActiveRecord::Migration
  def change
    add_column :applicants, :skype_order, :integer
  end
end
