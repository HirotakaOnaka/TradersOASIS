class AddColumnToFavorite < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorites, :user, foreign_key: true
    add_reference :favorites, :trading_method, foreign_key: true
  end
end
