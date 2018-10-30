class AddUserIdToTradingMethods < ActiveRecord::Migration[5.1]
  def change
    add_reference :trading_methods, :user, foreign_key: true
  end
end
