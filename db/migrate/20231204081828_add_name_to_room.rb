require 'faker'

class AddNameToRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :name, :string, default: "Room", null: false
  end
end
