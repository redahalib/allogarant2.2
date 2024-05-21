class AdmindashboardsController < ApplicationController
  before_action :authenticate_user!
  #before_action :is_admin?

  def index
    #@users = User.all
  end

  #private
  #def is_admin?
    #if current_user.role != "admin"
      #redirect_to root_path
    #end
  #end
end
