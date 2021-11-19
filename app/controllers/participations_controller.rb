class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  # GET /participations
  def index
    @q = Participation.ransack(params[:q])
    @participations = @q.result(:distinct => true).includes(:user, :challenge, :team).page(params[:page]).per(10)
  end

  # GET /participations/1
  def show
  end

  # GET /participations/new
  def new
    @participation = Participation.new
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations
  def create
    @participation = Participation.new(participation_params)

    if @participation.save
      message = 'Participation was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @participation, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /participations/1
  def update
    if @participation.update(participation_params)
      redirect_to @participation, notice: 'Participation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /participations/1
  def destroy
    @participation.destroy
    message = "Participation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to participations_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def participation_params
      params.require(:participation).permit(:user_id, :challenge_id, :team_id)
    end
end
