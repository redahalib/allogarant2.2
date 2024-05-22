class ProfilesController < ApplicationController
  before_action :authenticate_user!

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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :need, :budget, :city, :step, photos: [])
  end
end
