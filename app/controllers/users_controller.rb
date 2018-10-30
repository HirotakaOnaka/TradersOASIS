class UsersController < ApplicationController
  before_action:set_user, only:[:edit,:update,:show,:favorites,:usefuls]

  def index
  end

  def show
    @trading_methods = @user.trading_methods
  end

  def favorites
    @favorites_trading_methods = @user.favorite_trading_methods
    @favorite_hash = Favorite.where(user_id:current_user.id).pluck(:id,:trading_method_id).to_h
  end

  def usefuls
    @usefuls_trading_methods = @user.useful_trading_methods
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to charts_top_path unless @user.id == current_user.id
  end
end