class AddThingsToPet < ActiveRecord::Migration
  def change
    add_column :pets, :name, :string
    add_reference :pets, :user, index: true
    add_reference :pets, :animal, index: true
  end
end
