class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :department, foreign_key: true
      t.integer :supervisor_id, foreign_key: true
      t.string :access, default: "learner"

      t.timestamps
    end
  end
end
