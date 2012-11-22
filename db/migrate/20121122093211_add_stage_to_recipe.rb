class AddStageToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :stage, :string
  end
end
