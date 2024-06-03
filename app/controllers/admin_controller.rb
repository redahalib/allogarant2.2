class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def modify_steps
    @user = User.find(params[:user][:id])
    if @user.update(step: params[:user][:step])
      render json: { status: 'success' }
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end

  def index
    if request.post? && params[:user]
      modify_steps
    else
      @users = User.where(deleted: false, admin: nil).order(created_at: :desc)
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to root_path
    end
  end

  def update
    @passport = Passport.new
    @certificat = Certificat.new
    @passport.user = @user
    @passport.photos = params[:user][:passport]
    @certificat.user = @user
    @certificat.photos = params[:user][:certificat]

    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        redirect_to edit_profile_path(@user), notice: 'Documents enregistrés avec success'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def delete_user
    @user = User.find(params[:id])
    if @user.update(deleted: true)
      render json: { status: 'success' }
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :need, :budget, :city, :indicatif, :step, photos: [])
  end

  def authorize_admin
    redirect_to(root_path, alert: 'You are not authorized to access this page.') unless current_user.admin?
  end
end
