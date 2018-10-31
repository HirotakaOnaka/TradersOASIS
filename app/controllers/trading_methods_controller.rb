class TradingMethodsController < ApplicationController
  before_action :set_trading_method, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :destroy]

  def index
    if user_signed_in?
      @favorite_hash = Favorite.where(user_id:current_user.id).pluck(:id,:trading_method_id).to_h
      @useful_hash = Useful.where(user_id:current_user.id).pluck(:id,:trading_method_id).to_h
    end
    @search = TradingMethod.ransack(params[:q])
    @trading_methods = @search.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @trading_method = TradingMethod.find_by(id: params[:id])
    @user = @trading_method.user

    @favorite = current_user.favorites.find_by(trading_method_id: @trading_method.id)
    @favorite_hash = Favorite.where(user_id:current_user.id).pluck(:id,:trading_method_id).to_h

    @useful = current_user.usefuls.find_by(trading_method_id: @trading_method.id)
    @useful_hash = Useful.where(user_id:current_user.id).pluck(:id,:trading_method_id).to_h
  end

  def new
    if params[:back]
      @trading_method = TradingMethod.new(trading_method_params)
    else
      @trading_method = TradingMethod.new
    end
  end

  def edit
  end

  def create
    @trading_method = current_user.trading_methods.build(trading_method_params)
    respond_to do |format|
      if @trading_method.save
        format.html { redirect_to @trading_method, notice: 'Trading method was successfully created.' }
        format.json { render :show, status: :created, location: @trading_method }
      else
        format.html { render :new }
        format.json { render json: @trading_method.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trading_method.update(trading_method_params)
        format.html { redirect_to @trading_method, notice: 'Trading method was successfully updated.' }
        format.json { render :show, status: :ok, location: @trading_method }
      else
        format.html { render :edit }
        format.json { render json: @trading_method.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trading_method.destroy
    respond_to do |format|
      format.html { redirect_to trading_methods_url, notice: 'Trading method was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_trading_method
    @trading_method = TradingMethod.find(params[:id])
  end

  def trading_method_params
    params.require(:trading_method).permit(
      :title, :introduction, {:style => []}, {:pair => []},
      {:indicator => []}, {:market => []}, {:chart => []},
      :content1, :content2, :content3,
      :image1, :image2, :image3, :summery, :user_id,
      :favorites_count, :usefuls_count, :unusefuls_count
    )
  end

  def set_user
    redirect_to trading_methods_path unless @trading_method.user_id == current_user.id
  end

end
