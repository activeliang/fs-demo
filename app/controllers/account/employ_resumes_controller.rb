class Account::EmployResumesController < ApplicationController
  before_action :authenticate_user!

  def index
    @resumes = current_user.who_i_want
  end
end
