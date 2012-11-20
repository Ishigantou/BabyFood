class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_hash
      t.string :password_salt
      t.date :baby_birthday

      t.timestamps
    end
  end
end
