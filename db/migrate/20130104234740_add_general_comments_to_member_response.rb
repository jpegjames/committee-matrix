class AddGeneralCommentsToMemberResponse < ActiveRecord::Migration
  def change
    add_column :member_responses, :general_comments, :text
  end
end
