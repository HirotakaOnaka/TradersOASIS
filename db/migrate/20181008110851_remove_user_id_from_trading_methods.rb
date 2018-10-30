class RemoveUserIdFromTradingMethods < ActiveRecord::Migration[5.1]
  def change
    remove_column :trading_methods, :user_id
  end
end
