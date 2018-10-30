class CreateTradingMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :trading_methods do |t|
      t.string :title
      t.string :introduction
      t.string :style
      t.string :pair
      t.string :indicator
      t.string :market
      t.string :chart
      t.text :content1
      t.text :content2
      t.text :content3
      t.string :image1
      t.string :image2
      t.string :image3
      t.text :summery
      t.integer :user_id
      t.integer :favorites_count
      t.integer :usefuls_count
      t.integer :unusefuls_count

      t.timestamps
    end
  end
end
