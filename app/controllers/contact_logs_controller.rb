class ContactLogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contact_logs = current_user.contact_logs
  end
end
