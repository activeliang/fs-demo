class JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :require_job_permission, only:[:edit, :update, :destroy]
  before_action :validate_search_key, only: [:search]
  layout 'bc', only: [:show]

  def new
    @job = Job.new
    @cp_photo = @job.cp_photos.build #for multi-pics
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      if params[:cp_photos] != nil
        params[:cp_photos]['cp_in_image'].each do |a|
          @cp_photo = @job.cp_photos.create(:cp_in_image => a)
        end
      end
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
    @cp_photos = @job.cp_photos.all
    @job_labels = @job.jb_labels.where(:is_of_company => true)
    @cp_managers = @job.cp_managers
    @qr = RQRCode::QRCode.new(job_url(@job).to_s, :size => 6, :level => :h )
  end

  def edit
    @cp_product = CpProduct.new
    @cp_manager = CpManager.new
    @jb_label = JbLabel.new
  end

  def update
    if params[:cp_photos] != nil
     @job.cp_photos.destroy_all #need to destroy old pics first

     params[:cp_photos]['cp_in_image'].each do |a|
       @picture = @job.cp_photos.create(:cp_in_image => a)
     end
     @job.update(job_params)
     redirect_to jobs_path, notice: "updated!"
    elsif @job.update(job_params)
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

  def collect_job
    @job = Job.find(params[:id])
    if !current_user.is_collected_job?(@job)
      current_user.collect_job!(@job)
      flash[:notice] = "成功收藏！"
    else
      flash[:warning] = "你已收藏过了哦~"
    end
    redirect_to :back
  end

  def cancel_collect_job
    @job = Job.find(params[:id])
    if current_user.is_collected_job?(@job)
      current_user.cancel_collect_job!(@job)
      flash[:warning] = "您已取消收藏~！"
    else
      flash[:warning] = "还没收藏，怎么取消呢~~~XD"
    end
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Job.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private

  def require_job_permission
    @job = Job.find(params[:id])
    if @job.user != current_user and !current_user.is_admin
      redirect_to jobs_path, alert: "你不能修改他人发布的信息哦~"
    end
  end
  def job_params
    params.require(:job).permit(:title,:department,:wage_upper_bound,:wage_lower_bound,:is_fulltime,  :temptation, :task, :claim,:is_show,:cp_image,:cp_name,:cp_subtitle,:quantity,:cp_type,:cp_stage,:cp_number,:cp_city, :cp_description,:cp_lng,:cp_lat,:cp_website,:cp_in_image, :product_link)
  end
end
