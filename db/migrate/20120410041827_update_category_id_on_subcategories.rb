class UpdateCategoryIdOnSubcategories < ActiveRecord::Migration
  def up
    def change
      change_column :subcategories, :category_id, :integer
    end
  end

  def down
    raise ActiveRecord::IrreversableMigration
      change_column :subcategories, :category_id
    raise ActiveRecord::IrreversableMigration
  end
end
