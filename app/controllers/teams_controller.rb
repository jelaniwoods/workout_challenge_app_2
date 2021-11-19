class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @q = Team.ransack(params[:q])
    @teams = @q.result(distinct: true).includes(:challenge,
                                                :participations).page(params[:page]).per(10)
  end

  def show
    @participation = Participation.new
  end

  def new
    @team = Team.new
  end

  def edit; end

  def create
    @team = Team.new(team_params)

    if @team.save
      message = "Team was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @team, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Team was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    message = "Team was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to teams_url, notice: message
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:team_name, :team_picture, :challenge_id)
  end
end
