class AddSkypeCommentsToApplicants < ActiveRecord::Migration
  def change
    add_column :member_responses, :skype_comments, :text
  end
end
