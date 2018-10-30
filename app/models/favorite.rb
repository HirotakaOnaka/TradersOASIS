class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :trading_method
end
