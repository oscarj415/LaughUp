class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :rating
      t.text :content
      t.references :reviewed, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
