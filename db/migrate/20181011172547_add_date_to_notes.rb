class AddDateToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :entry_date, :datetime
    add_column :notes, :contract_date, :datetime
  end
end
