class Meals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :food
      t.integer :calories
      t.integer :fat
      t.integer :sugar
      t.integer :salt
      t.integer :carbs
      t.integer :protein
    end
  end
end
