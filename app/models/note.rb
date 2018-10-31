class Note < ApplicationRecord
  validates :trading_method, presence: true
  validates :lot, presence: true
  validates :order, presence: true
  validates :pair, presence: true
  validates :entry_rate, presence: true
  validates :entry_date, presence: true
  validates :contract_rate, presence: true
  validates :contract_date, presence: true
  validates :score, presence: true
  
  belongs_to :user
  
  before_save do
    self.pair.gsub!(/[\[\]\"]/, "") if attribute_present?("pair")
    if order == "BUY"
      self.pips = (contract_rate - entry_rate) * 100 if attribute_present?("contract_rate")
    else
      self.pips = (entry_rate - contract_rate) * 100 if attribute_present?("contract_rate")
    end
  end
end
