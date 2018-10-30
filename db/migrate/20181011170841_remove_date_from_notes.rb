class RemoveDateFromNotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :notes, :entry_date
    remove_column :notes, :contract_date
  end
end
