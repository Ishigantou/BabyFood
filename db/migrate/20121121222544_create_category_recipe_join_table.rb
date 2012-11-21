class CreateCategoryRecipeJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_recipes, id: false do |t|
      t.integer :category_id
      t.integer :recipe_id
      t.index [:category_id, :recipe_id]
      t.index [:recipe_id, :category_id]
    end
  end
end
