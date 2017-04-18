class JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :require_job_permission, only:[:edit, :update, :destroy]
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path, notice: "created!"
    else
      render :new
    end
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "updated!"
    else
      render :edit
    end
  end

  def destroy
    if @job.destroy
      redirect_to jobs_path, alert: "Deleted!"
    end
  end

  def apply_join
    @job = Job.find(params[:id])
    if !current_user.is_apply_job?(@job)
      current_user.apply_join!(@job)
      flash[:notice] = "成功申请该职位，已将简历投资给信息发布者~"
    else
      flash[:warning] = "你已申请过该职位了哦~"
    end
    redirect_to job_path(@job)
  end

  def cancel_join
    @job = Job.find(params[:id])
    if current_user.is_apply_job?(@job)
      current_user.cancel_join!(@job)
      flash[:warning] = "你已成功撤消申请该职位！"
    else
      flash[:warning] = "你目前未申请该职位哦~"
    end
    redirect_to job_path(@job)
  end

  private

  def require_job_permission
    @job = Job.find(params[:id])
    if @job.user != current_user
      redirect_to jobs_path, alert: "你不能修改他人发布的信息哦~"
    end
  end
  def job_params
    params.require(:job).permit(:title, :task, :wage_upper_bound, :wage_lower_bound, :description, :detail, :scale, :website, :work_time, :five_gold, :overtime_pay, :address, :contact_wechat)
  end
end
