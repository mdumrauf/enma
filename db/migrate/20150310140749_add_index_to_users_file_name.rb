class AddIndexToUsersFileName < ActiveRecord::Migration
  def change
  	add_index :users, :file_number, unique: true
  end
end
