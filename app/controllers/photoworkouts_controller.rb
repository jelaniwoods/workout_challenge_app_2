class PhotoworkoutsController < ApplicationController
  before_action :set_photoworkout, only: [:show, :edit, :update, :destroy]

  # GET /photoworkouts
  def index
    @photoworkouts = Photoworkout.page(params[:page]).per(10)
  end

  # GET /photoworkouts/1
  def show
  end

  # GET /photoworkouts/new
  def new
    @photoworkout = Photoworkout.new
  end

  # GET /photoworkouts/1/edit
  def edit
  end

  # POST /photoworkouts
  def create
    @photoworkout = Photoworkout.new(photoworkout_params)

    if @photoworkout.save
      message = 'Photoworkout was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @photoworkout, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /photoworkouts/1
  def update
    if @photoworkout.update(photoworkout_params)
      redirect_to @photoworkout, notice: 'Photoworkout was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photoworkouts/1
  def destroy
    @photoworkout.destroy
    message = "Photoworkout was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to photoworkouts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photoworkout
      @photoworkout = Photoworkout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photoworkout_params
      params.require(:photoworkout).permit(:caption, :challenge_id, :user_id, :likes_count, :photo_locator, :calories, :main_exercise)
    end
end
