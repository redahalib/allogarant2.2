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
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        save_documents
        redirect_to edit_profile_path(@user), notice: 'Documents enregistrés avec success'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  private

  def save_documents
    @passport = @user.passports.create(photos: params[:user][:passport])
    @certificat = @user.certificats.create(photos: params[:user][:certificat])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :need, :budget,
                                 :city, :step, :indicatif, :passport, :certificat, photos: [])
  end
end
