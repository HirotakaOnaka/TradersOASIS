class CreateUnusefuls < ActiveRecord::Migration[5.1]
  def change
    create_table :unusefuls do |t|
      t.integer :user_id
      t.integer :trading_method_id

      t.timestamps
    end
  end
end
