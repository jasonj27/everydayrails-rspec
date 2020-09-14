class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def project_owner?
    unless @project.owner == current_user
      redirect_to root_path, alert: "You don't have access to that project."
    end
  end
end
