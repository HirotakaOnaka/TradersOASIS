class AddEntryRateToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :entry_rate, :decimal
  end
end
