class NotesController < ApplicationController
  before_action :set_note, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    @notes = Note.all
    @search = Note.ransack(params[:q])
    @notes = @search.result.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @note = Note.new(post_params)
    @note.user_id = current_user.id
    render :new if @note.invalid?
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(
      :trading_method, 
      {:pair => []}, 
      :lot, 
      :entry_rate, 
      :entry_date, 
      :contract_rate, 
      :contract_date, 
      :pips, 
      :comment, 
      :image1, 
      :image2, 
      :score, 
      :order
    )
  end

  def set_user
    redirect_to notes_path unless @note.user_id == current_user.id
  end
end