class AddNameAndLastnameAndFileNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :file_number, :integer
  end
end
