class Admin::JobsController < ApplicationController
  before_action :admin_required, only: [:create, :update, :destroy]
  layout 'admin'
  def index
    @jobs = Job.order("id DESC")
  end

  def edit
    @job = Job.find(params[:id])
    @cp_product = CpProduct.new
    @cp_manager = CpManager.new
    @jb_label = JbLabel.new
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to :back, notice: "updated!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to :back, alert: "Deleted!"
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :task, :wage_upper_bound, :wage_lower_bound, :description, :detail, :scale, :website, :work_time, :five_gold, :overtime_pay, :address, :contact_wechat, :is_show)
  end
end
