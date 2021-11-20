class ContactsController < ApplicationController
  before_action :authenticate_user!
  # before_action :assign_contact, only: [:show]

  # def show
  # end

  def index
    @contacts = current_user.contacts
  end

  # private

  # def assign_contact
  #   @contact = ContactFile.find(params[:id])
  # end
end
