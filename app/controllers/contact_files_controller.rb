class ContactFilesController < ApplicationController
  before_action :authenticate_user!

  before_action :assign_contact_file, only: [:show]

  respond_to :html

  def index
    @contact_files = current_user.contact_files
  end

  def show; end

  def new
    @contact_file = current_user.contact_files.new
  end

  def create
    @contact_file = current_user.contact_files.create(contact_file_params)
    flash[:notice] = 'Contact file was successfully created.' if @contact_file.save
    respond_with(@contact_file)
  end

  private

  def assign_contact_file
    @contact_file = ContactFile.find(params[:id])
  end

  def contact_file_params
    params.require(:contact_file).permit(:alias_name, :alias_email, :alias_phone,
                                         :alias_address, :alias_date_of_birth,
                                         :alias_credit_card, :csv)
  end
end