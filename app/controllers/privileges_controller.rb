class PrivilegesController < ApplicationController
  before_action :current_user_must_be_privilege_user,
                only: %i[edit update destroy]

  before_action :set_privilege, only: %i[show edit update destroy]

  def index
    @q = Privilege.ransack(params[:q])
    @privileges = @q.result(distinct: true).includes(:user,
                                                     :challenge).page(params[:page]).per(10)
  end

  def show; end

  def new
    @privilege = Privilege.new
  end

  def edit; end

  def create
    @privilege = Privilege.new(privilege_params)

    if @privilege.save
      message = "Privilege was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @privilege, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @privilege.update(privilege_params)
      redirect_to @privilege, notice: "Privilege was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @privilege.destroy
    message = "Privilege was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to privileges_url, notice: message
    end
  end

  private

  def current_user_must_be_privilege_user
    set_privilege
    unless current_user == @privilege.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_privilege
    @privilege = Privilege.find(params[:id])
  end

  def privilege_params
    params.require(:privilege).permit(:challenge_id, :user_id)
  end
end
