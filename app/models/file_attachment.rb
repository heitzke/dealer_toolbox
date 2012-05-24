class FileAttachment < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :folder
  has_attached_file :attachment_file
  validates_attachment_presence :attachment_file
end
