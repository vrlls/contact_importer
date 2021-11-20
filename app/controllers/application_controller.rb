class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  
  private

  def resource_not_found
    respond_to do |format|
      format.html{ render template: '/contact_files/index', status: 404 }
    end
  end
end
