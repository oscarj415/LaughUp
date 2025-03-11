class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :comedian, null: false, foreign_key: { to_table: :users }
      t.references :venue, null: false, foreign_key: { to_table: :users }
      t.datetime :date_time
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
