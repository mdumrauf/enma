class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :description
    end
    add_belongs_to :users, :course
  end
end