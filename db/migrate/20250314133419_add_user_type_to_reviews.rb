class AddUserTypeToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :user_type, :integer
  end
end
