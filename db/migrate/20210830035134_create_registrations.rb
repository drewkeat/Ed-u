class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.integer :learner_id
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
