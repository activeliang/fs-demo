class Admin::DashboardController < ApplicationController
  before_action :admin_required
  layout 'admin'
  def index
    @resumes = Resume.order("id DESC")
    @jobs = Job.order("id DESC")
  end
end
