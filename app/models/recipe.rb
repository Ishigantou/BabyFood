class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories

  scope :category, -> cat {
    if cat.is_a? ActiveRecord::Relation or cat.is_a? Array
      cat.inject(all) {|cats, c|  cats.category(c)}
    else
      where([
        'id in (select cr.recipe_id from `categories_recipes` as cr where cr.category_id = ?)',
        cat.id
      ])
    end
  }
end
