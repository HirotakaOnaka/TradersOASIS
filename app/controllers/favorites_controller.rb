class FavoritesController < ApplicationController
  def create
    @trading_method = TradingMethod.find(params[:trading_method_id])
    @favorite = Favorite.create(user_id: current_user.id, trading_method_id: @trading_method.id)
    @favorite_hash ={}
    @favorite_hash[@trading_method.id] = @trading_method.id

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @trading_method = TradingMethod.find(params[:trading_method_id])
    favorite = Favorite.find_by(user_id: current_user.id, trading_method_id:@trading_method.id)
    favorite.destroy
    @favorite_hash ={}

    respond_to do |format|
      format.html
      format.js
    end
  end
  
end