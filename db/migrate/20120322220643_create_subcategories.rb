class CreateSubcategories < ActiveRecord::Migration
  def up
    create_table :subcategories do |t|
      t.string :name
      t.string :description
      t.integer :category_id
    end

  end

  def down
    drop_table :subcategories
  end
end
