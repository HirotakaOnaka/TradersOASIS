class AddOrderToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :order, :string
  end
end
