class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :latin_name
      t.integer :av_weight
      t.integer :stock

      t.timestamps
    end
  end
end
