class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def verify_admin
    redirect_to root_path, alert: "Acesso negado!" unless current_user&.admin?
  end
end
