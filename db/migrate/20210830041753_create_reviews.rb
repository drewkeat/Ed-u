class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :reviewer_id
      t.references :reviewable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
