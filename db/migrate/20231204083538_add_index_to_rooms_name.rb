class AddIndexToRoomsName < ActiveRecord::Migration[7.0]
  def change
    add_index :rooms, :name
  end
end
