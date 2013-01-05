class AddScoreToMemberResponse < ActiveRecord::Migration
  def change
    add_column :member_responses, :score, :decimal, :precision => 5, :scale => 4
  end
end
