class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def index
    @contacts = Contact.all
    render :index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: "Contact message sent successfully!"
    else
      render :new
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: "Contact message deleted!"
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message, :full_name, :phone, :subject)
  end
end
