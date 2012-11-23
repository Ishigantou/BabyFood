class AddStartAtAndEndAtToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :start_at, :datetime
    add_column :menus, :end_at, :datetime
  end
end
