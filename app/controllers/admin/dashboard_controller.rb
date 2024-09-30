# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    # Admin dashboard logic here (e.g., show statistics, etc.)
  end

  private

  def check_if_admin
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end
end
