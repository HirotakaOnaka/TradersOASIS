class UnusefulsController < ApplicationController
  def create
    unuseful = current_user.unusefuls.create(trading_method_id: params[:trading_method_id])
    redirect_to trading_methods_url, notice: "手法（ Title : #{unuseful.trading_method.title} ）を使える手法に登録しました"
  end

  def destroy
    unuseful = current_user.unusefuls.find_by(id: params[:id]).destroy
    redirect_to trading_methods_url, notice: "手法（ Title : #{unuseful.trading_method.title} ）を使える手法から解除しました"
  end
end
