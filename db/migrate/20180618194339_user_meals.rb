class UserMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :user_meals do |t|
     t.integer :user_id
     t.integer :meal_id
     end
  end
end
