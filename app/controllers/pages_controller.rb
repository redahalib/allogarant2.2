class PagesController < ApplicationController
  include Devise::Controllers::Helpers
  skip_before_action :authenticate_user!, only: [:home, :conditions_generales, :faq, :about, :mentions_legales, :politique_de_confidentialite]

  def home
  end

end
