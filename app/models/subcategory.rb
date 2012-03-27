class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many   :file_attachments
end
