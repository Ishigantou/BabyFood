class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :user, index: true
      t.references :staple_recipe, index: true
      t.references :main_recipe, index: true
      t.references :side_recipe, index: true
      t.text :comment
      t.text :photo

      t.timestamps
    end
  end
end
