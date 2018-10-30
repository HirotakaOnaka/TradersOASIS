class AddColumnToUseful < ActiveRecord::Migration[5.1]
  def change
    add_reference :usefuls, :user, foreign_key: true
    add_reference :usefuls, :trading_method, foreign_key: true
  end
end
