class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title

      t.timestamps
    end

    add_column :applicants, :position_id, :integer
    add_index :applicants, :position_id
  end
end
