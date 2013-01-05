class AddStatsToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :average_score, :decimal, :precision => 6, :scale => 5
    add_column :applicants, :average_score_sort, :decimal, :precision => 3, :scale => 2
    add_column :applicants, :average_score_precision, :decimal, :precision => 4, :scale => 3
  end
end
