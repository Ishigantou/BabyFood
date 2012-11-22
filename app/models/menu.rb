class Menu < ActiveRecord::Base
  belongs_to :user
  belongs_to :staple_recipe, class_name: 'Recipe'
  belongs_to :main_recipe, class_name: 'Recipe'
  belongs_to :side_recipe, class_name: 'Recipe'
end
