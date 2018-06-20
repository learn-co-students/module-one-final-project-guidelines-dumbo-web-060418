class AddMeaningsToPlanets < ActiveRecord::Migration[5.0]
  def change
    add_column :planets, :meaning, :string
  end
end
