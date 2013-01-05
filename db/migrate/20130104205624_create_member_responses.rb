class CreateMemberResponses < ActiveRecord::Migration
  def change
    create_table :member_responses do |t|
      t.integer :q1a
      t.text :q1c
      t.integer :q2a
      t.text :q2c
      t.integer :q3a
      t.text :q3c
      t.integer :q4a
      t.text :q4c
      t.integer :q5a
      t.text :q5c
      t.integer :q6a
      t.text :q6c
      t.integer :q7a
      t.text :q7c
      t.integer :q8a
      t.text :q8c
      t.integer :q9a
      t.text :q9c
      t.integer :q10a
      t.text :q10c

      t.timestamps
    end
  end
end
