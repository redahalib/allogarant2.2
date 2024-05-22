class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    @user_id = params["user_id"].present? ? params["user_id"] : current_user.id
		@user = User.find(@user_id)

  def create
    @profile = Profile.new(profile_params)
    @user_id = profile_params["user_id"].present? ? profile_params["user_id"] : current_user.id
    @profile.update(user_id: @user_id)

    if @profile.save
      redirect_to profiles_path
    else
      render 'new'
    end
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      flash[:alert] = "Modifications enregistrées avec success"
      redirect_to profiles_path
    else
      flash[:alert] = "Erreur"
     end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :passport, :city, :need, :certificat, :budget)
  end


end
