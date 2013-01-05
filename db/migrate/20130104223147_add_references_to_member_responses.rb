class AddReferencesToMemberResponses < ActiveRecord::Migration
  def change
    add_column :member_responses, :applicant_id, :integer
    add_column :member_responses, :member_id, :integer
  end
end
