class AddDistanceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :distance, :float
  end
end
