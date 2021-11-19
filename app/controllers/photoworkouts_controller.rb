class PhotoworkoutsController < ApplicationController
  before_action :set_photoworkout, only: %i[show edit update destroy]

  def index
    @q = Photoworkout.ransack(params[:q])
    @photoworkouts = @q.result(distinct: true).includes(:user,
                                                        :challenge).page(params[:page]).per(10)
  end

  def show; end

  def new
    @photoworkout = Photoworkout.new
  end

  def edit; end

  def create
    @photoworkout = Photoworkout.new(photoworkout_params)

    if @photoworkout.save
      message = "Photoworkout was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @photoworkout, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @photoworkout.update(photoworkout_params)
      redirect_to @photoworkout,
                  notice: "Photoworkout was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @photoworkout.destroy
    message = "Photoworkout was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to photoworkouts_url, notice: message
    end
  end

  private

  def set_photoworkout
    @photoworkout = Photoworkout.find(params[:id])
  end

  def photoworkout_params
    params.require(:photoworkout).permit(:caption, :challenge_id, :user_id,
                                         :likes_count, :photo_locator, :calories, :main_exercise)
  end
end
