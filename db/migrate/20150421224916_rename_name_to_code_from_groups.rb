class RenameNameToCodeFromGroups < ActiveRecord::Migration
  def change
    rename_column :groups, :name, :code
  end
end
