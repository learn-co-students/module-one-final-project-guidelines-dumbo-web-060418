class CreateSigns < ActiveRecord::Migration[5.0]
  def change
    create_table :signs do |t|
      t.string :name
      t.string :element
      t.string :quality
      t.string :ruled_by
    end
  end
end
