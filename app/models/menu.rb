class Menu < ActiveRecord::Base
  belongs_to :user
  belongs_to :staple_recipe, class_name: 'Recipe'
  belongs_to :main_recipe, class_name: 'Recipe'
  belongs_to :side_recipe, class_name: 'Recipe'

  has_event_calendar

  scope :day, -> date {
    where(created_at: date.beginning_of_day..date.end_of_day)
  }

  def recipes
    [staple_recipe, main_recipe, side_recipe].compact
  end

  def day_path
    "/menus/#{year}/#{month}/#{day}"
  end

  def year
    created_at.year
  end

  def month
    created_at.month
  end

  def day
    created_at.day
  end

  def today?
    created_at.to_date == Date.today
  end
end
