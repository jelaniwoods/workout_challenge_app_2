class PhotoworkoutsController < ApplicationController
  before_action :set_photoworkout, only: [:show, :edit, :update, :destroy]

  # GET /photoworkouts
  def index
    @photoworkouts = Photoworkout.all
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
      redirect_to @photoworkout, notice: 'Photoworkout was successfully created.'
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
    redirect_to photoworkouts_url, notice: 'Photoworkout was successfully destroyed.'
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
