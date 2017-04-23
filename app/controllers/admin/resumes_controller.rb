class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required, only:[:create, :update, :destroy]
  layout 'admin'


  def index
    @resumes = Resume.order("id DESC")
  end
  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to admin_resumes_path, notice: "updated!"
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    if @resume.destroy
      redirect_to :back, alert: "Deleted!"
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :semester, :work_place, :description, :app_image, :logdown, :fs_username, :contact_email, :is_show, :introduction, :fs_link, :wmf, :wms, :wmf_link, :wmf_git, :wms_link, :wms_git, :wechatimg )
  end
end
