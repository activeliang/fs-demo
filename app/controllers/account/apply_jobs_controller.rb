class Account::ApplyJobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @apply_jobs = current_user.apply_job
  end
end
