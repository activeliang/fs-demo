class ResumesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy, :edit, :update]
  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user
    if @resume.save
      redirect_to resumes_path, notice: "created!"
    else
      render :new
    end
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: "updated!"
    else
      render :edit
    end
  end

  def index
    @resume = Resume.all
  end

  def destroy
    @resume = Resume.find(params[:id])
    if @resume.destroy
      redirect_to resumes_path, warning: "Deleted!"
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :semester, :work_place, :description, :app_image, :logdown, :fs_username, :contact_email )
  end
end
