class ResumesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy, :edit, :update]
  before_action :require_resume_permission, only:[:edit, :update, :destroy]
  def new
    @resume = Resume.new
    @photo = @resume.photos.build
  end

  def show
    @resume = Resume.find(params[:id])
    @photos = @resume.photos.all
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    if @resume.save
            if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @resume.photos.create(:avatar => a)
        end
      end
      redirect_to resumes_path, notice: "created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: "updated!"
    else
      render :edit
    end
  end

  def index
    @resumes = Resume.all
  end

  def destroy
    if @resume.destroy
      redirect_to resumes_path, warning: "Deleted!"
    end
  end

  def employ_it
    @resume = Resume.find(params[:id])
    if !current_user.is_employ_it?(@resume)
      current_user.employ_it!(@resume)
      flash[:notice] = "已成功发送邀请给TA~"
    else
      flash[:warning] = "你已经邀请过了哦~"
    end
    redirect_to resume_path(@resume)
  end

  def cancel_employ
    @resume = Resume.find(params[:id])
    if current_user.is_employ_it?(@resume)
      current_user.cancel_employ!(@resume)
      flash[:alert] = "成功撤消邀请……"
    else
      flash[:warning] = "你还未邀请TA哦~"
    end
    redirect_to resume_path(@resume)
  end


  private
  def require_resume_permission
    @resume = Resume.find(params[:id])
    if current_user != @resume.user
      redirect_to resumes_path, alert: "您无法修改他人简历哦~"
    end
  end

  def resume_params
    params.require(:resume).permit(:name, :semester, :work_place, :description, :app_image, :logdown, :fs_username, :contact_email )
  end
end
