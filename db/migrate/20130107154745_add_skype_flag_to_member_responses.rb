class AddSkypeFlagToMemberResponses < ActiveRecord::Migration
  def change
    add_column :member_responses, :skype_vote, :boolean
    add_column :applicants, :skype_vote_total, :integer
  end
end
