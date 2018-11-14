class CreateCharts < ActiveRecord::Migration[5.0]
  def change
    create_table :charts do |t|
      t.integer :user_id
      t.integer :planet_id
      t.integer :sign_id
    end
  end
end
