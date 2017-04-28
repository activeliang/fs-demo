class JbLabelsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @jb_label = JbLabel.new
  end

  def create
    @job = Job.find(params[:job_id])
    @jb_label = JbLabel.new(jb_label_params)
    @jb_label.job = @job
    if @jb_label.save
      redirect_to :back, notice: "created!"
    else
      render :back, alert: "新增失败！"
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @jb_label = JbLabel.find(params[:id])
    if @jb_label.destroy
      redirect_to :back, alert: "Deleted!"
    end
  end
  private
  def jb_label_params
    params.require(:jb_label).permit(:label_item, :is_of_company, :is_of_product)
  end
end
