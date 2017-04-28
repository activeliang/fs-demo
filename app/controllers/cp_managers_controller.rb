class CpManagersController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @cp_manager = CpManager.new
  end

  def create
    @job = Job.find(params[:job_id])
    @cp_manager = CpManager.new(cp_manager_params)
    @cp_manager.job = @job
    if @cp_manager.save
      redirect_to :back, notice: "created!"
    else
      render :back, alert: "新增失败！"
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @cp_manager = CpManager.find(params[:id])
    if @cp_manager.destroy
      redirect_to :back, alert: "Deleted!"
    end 
  end

  private
  def cp_manager_params
    params.require(:cp_manager).permit(:name, :manager_image, :post, :description, :website)
  end

end
