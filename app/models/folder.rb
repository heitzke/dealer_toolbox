class Folder < ActiveRecord::Base

  belongs_to :subcategory
  has_many   :file_attachments

end
