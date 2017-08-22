class AddAncestryToFolder < ActiveRecord::Migration[5.0]
  def change
    add_column :folders, :ancestry, :string
    add_index :folders, :ancestry
  end
end
