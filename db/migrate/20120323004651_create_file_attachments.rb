class CreateFileAttachments < ActiveRecord::Migration
  def self.up
    create_table :file_attachments do |t|
      t.has_attached_file :attachment_file
      t.string  :name
      t.integer :subcategory_id
    end
  end

  def self.down
    drop_table :file_attachments
  end
end
