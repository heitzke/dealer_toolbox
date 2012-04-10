class Category < ActiveRecord::Base
  has_many :subcategories

  def subcategories
    Subcategory.find_all_by_category_id(self.id)
  end


end
