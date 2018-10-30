class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.decimal :contract_rate
      t.date :entry_date
      t.date :contract_date
      t.decimal :pips
      t.text :comment
      t.string :image1
      t.string :image2
      t.string :trading_method
      t.string :score
      t.decimal :lot
      t.string :pair

      t.timestamps
    end
  end
end
