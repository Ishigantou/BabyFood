# coding: utf-8
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

  def self.recommended stage = nil
    staple = main = side = nil
    self.where(stage: stage).shuffle.each do |r|
      categories = r.categories.map(&:title)
      if categories.include?('主食')
        staple = r unless staple
      elsif categories.include?('主菜')
        main = r unless main
      elsif categories.include?('副菜')
        side = r unless side
      end
      return [staple, main, side] if staple && main && side
    end
    []
  end
end
