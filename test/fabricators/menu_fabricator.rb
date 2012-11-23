# coding: utf-8
Fabricator(:menu) do
  user{ User.last || Fabricate(:user) }
  staple_recipe{ Fabricate(:recipe, categories: [Category.find_or_create_by(title: '主食')]) }
  main_recipe{ Fabricate(:recipe, categories: [Category.find_or_create_by(title: '主菜')]) }
  side_recipe{ Fabricate(:recipe, categories: [Category.find_or_create_by(title: '副菜')]) }
  comment{ sequence(:comment, 1){|i| "comment#{i}" } }
  #photo
end
