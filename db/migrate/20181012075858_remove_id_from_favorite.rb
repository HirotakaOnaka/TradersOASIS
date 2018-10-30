class RemoveIdFromFavorite < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :user_id
    remove_column :favorites, :trading_method_id
  end
end
