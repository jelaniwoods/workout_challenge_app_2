class PrivilegesController < ApplicationController
  before_action :set_privilege, only: [:show, :edit, :update, :destroy]

  # GET /privileges
  def index
    @privileges = Privilege.all
  end

  # GET /privileges/1
  def show
  end

  # GET /privileges/new
  def new
    @privilege = Privilege.new
  end

  # GET /privileges/1/edit
  def edit
  end

  # POST /privileges
  def create
    @privilege = Privilege.new(privilege_params)

    if @privilege.save
      redirect_to @privilege, notice: 'Privilege was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /privileges/1
  def update
    if @privilege.update(privilege_params)
      redirect_to @privilege, notice: 'Privilege was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /privileges/1
  def destroy
    @privilege.destroy
    redirect_to privileges_url, notice: 'Privilege was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privilege
      @privilege = Privilege.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def privilege_params
      params.require(:privilege).permit(:challenge_id, :user_id)
    end
end
