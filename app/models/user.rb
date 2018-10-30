class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trading_methods, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_trading_methods, through: :favorites, source: :trading_method
  has_many :usefuls, dependent: :destroy
  has_many :useful_trading_methods, through: :usefuls, source: :trading_method
  has_many :unusefuls, dependent: :destroy
end
