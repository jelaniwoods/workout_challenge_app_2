class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[show edit update destroy]

  def index
    @q = Participation.ransack(params[:q])
    @participations = @q.result(distinct: true).includes(:user, :challenge,
                                                         :team).page(params[:page]).per(10)
  end

  def show; end

  def new
    @participation = Participation.new
  end

  def edit; end

  def create
    @participation = Participation.new(participation_params)

    if @participation.save
      message = "Participation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @participation, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @participation.update(participation_params)
      redirect_to @participation,
                  notice: "Participation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @participation.destroy
    message = "Participation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to participations_url, notice: message
    end
  end

  private

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    params.require(:participation).permit(:user_id, :challenge_id, :team_id)
  end
end
