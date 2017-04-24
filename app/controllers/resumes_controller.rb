class ResumesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :destroy, :edit, :update]
  before_action :require_resume_permission, only:[:edit, :update, :destroy]
  layout 'bc', only: [:show]
  def new
    @resume = Resume.new
    @photo = @resume.photos.build
    if current_user.resumes.present?
      redirect_to "/", alert: "你已经有简历存在了，一人只能生成一张简历哦~"
    end
  end

  def show
    @resume = Resume.find(params[:id])
    @photos = @resume.photos.all
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    if current_user.resumes.present?
      redirect_to "/", alert: "你已经有简历存在了，一人只能生成一张简历哦~"

    elsif @resume.save
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
    @tag = Tag.new
    @tags = @resume.tags
  end

  def update
    @resume = Resume.find(params[:id])

    if params[:photos] != nil
      @resume.photos.destroy_all #need to destroy old pics first

      params[:photos]['avatar'].each do |a|
        @picture = @resume.photos.create(:avatar => a)
      end

      @resume.update(resume_params)
      redirect_to resumes_path

    elsif @resume.update(resume_params)
      redirect_to resumes_path
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
    if !current_user
      flash[:warning] = "请先登入哦~！"
      redirect_to :back

    elsif !current_user.is_employ_it?(@resume)
      current_user.employ_it!(@resume)
      flash[:notice] = "已成功发送邀请给TA~"
      redirect_to resume_path(@resume)
    else
      flash[:warning] = "你已经邀请过了哦~"
      redirect_to resume_path(@resume)
    end
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
    params.require(:resume).permit(:name, :semester, :work_place, :description, :app_image, :logdown, :fs_username, :contact_email, :is_show, :introduction, :fs_link, :wmf, :wms, :wmf_link, :wms_link, :wms_git, :wmf_git, :wechatimg )
  end
end
