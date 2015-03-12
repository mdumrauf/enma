class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.belongs_to :course
    end
    add_belongs_to :users, :group
  end
end
