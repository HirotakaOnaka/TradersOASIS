class UsefulsController < ApplicationController
  def create
    @trading_method = TradingMethod.find(params[:trading_method_id])
    @useful = Useful.create(user_id: current_user.id, trading_method_id: @trading_method.id)
    @useful_hash ={}
    @useful_hash[@trading_method.id] = @trading_method.id

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @trading_method = TradingMethod.find(params[:trading_method_id])
    useful = Useful.find_by(user_id: current_user.id, trading_method_id:@trading_method.id)
    useful.destroy
    @useful_hash ={}

    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
