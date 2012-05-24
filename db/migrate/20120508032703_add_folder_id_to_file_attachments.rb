class AddFolderIdToFileAttachments < ActiveRecord::Migration
  def change
    add_column :file_attachments, :folder_id, :integer
  end
end
