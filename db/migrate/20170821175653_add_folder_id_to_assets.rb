class AddFolderIdToAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :folder_id, :integer
    add_index :assets,:folder_id
  end
  def self.down 
    remove_column :assets, :folder_id
  end
end
