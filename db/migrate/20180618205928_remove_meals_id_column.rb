class RemoveMealsIdColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :meals_id
  end
end
