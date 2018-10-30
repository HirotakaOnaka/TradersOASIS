class TradingMethod < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :introduction, presence: true, length: { maximum: 255 }
  validates :style, presence: true
  validates :pair, presence: true
  validates :indicator, presence: true
  validates :market, presence: true
  validates :chart, presence: true
  validates :content1, presence: true
  validates :summery, presence: true
  
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorite, source: :user

  has_many :usefuls, dependent: :destroy
  has_many :useful_users, through: :useful, source: :user

  has_many :unusefuls, dependent: :destroy
  has_many :unuseful_users, through: :unuseful, source: :user
  
  before_save do
    self.pair.gsub!(/[\[\]\"]/, "") if attribute_present?("pair")
    self.style.gsub!(/[\[\]\"]/, "") if attribute_present?("style")
    self.market.gsub!(/[\[\]\"]/, "") if attribute_present?("market")
    self.indicator.gsub!(/[\[\]\"]/, "") if attribute_present?("indicator")
    self.chart.gsub!(/[\[\]\"]/, "") if attribute_present?("chart")
  end
  
  paginates_per 10
  
end
