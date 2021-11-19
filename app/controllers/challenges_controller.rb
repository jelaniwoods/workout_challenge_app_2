class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[show edit update destroy]

  def index
    @q = Challenge.ransack(params[:q])
    @challenges = @q.result(distinct: true).includes(:participations,
                                                     :photos, :privileges, :teams).page(params[:page]).per(10)
  end

  def show
    @team = Team.new
    @privilege = Privilege.new
    @photoworkout = Photoworkout.new
    @participation = Participation.new
  end

  def new
    @challenge = Challenge.new
  end

  def edit; end

  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.save
      redirect_to @challenge, notice: "Challenge was successfully created."
    else
      render :new
    end
  end

  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: "Challenge was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_url, notice: "Challenge was successfully destroyed."
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:starting_time, :ending_time,
                                      :challenge_name, :challenge_image, :removal_policy, :new_user_policy, :penalty_policy, :workout_perday_policy, :workout_criteria, :prize_policy, :challenge_handle, :number_of_teams)
  end
end
