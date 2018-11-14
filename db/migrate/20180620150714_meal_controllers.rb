class MealControllers < ActiveRecord::Migration[5.0]
  def change
  	create_table :meal_controllers do |t|
  		t.integer :user_id
  	end
  end
end
