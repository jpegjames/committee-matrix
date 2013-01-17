class AddSkypeListValueToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :skype_list, :intenger, :default => 2
  end
end
