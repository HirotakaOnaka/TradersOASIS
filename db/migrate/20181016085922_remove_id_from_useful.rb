class RemoveIdFromUseful < ActiveRecord::Migration[5.1]
  def change
    remove_column :usefuls, :user_id
    remove_column :usefuls, :trading_method_id
  end
end
