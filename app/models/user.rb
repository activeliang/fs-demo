class User < ApplicationRecord
  mount_uploader :aavatar, AavatarUploader

  # User Avatar Validation
  validates_integrity_of  :aavatar
  validates_processing_of :aavatar



  # Include default devise modules. Others aavailable are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :resumes
  has_many :jobs
  has_many :job_relationships
  has_many :apply_job, through: :job_relationships, source: :job
  has_many :resume_relationships
  has_many :who_i_want, through: :resume_relationships, source: :resume
  has_many :mycollects
  has_many :collected_job, through: :mycollects, source: :job
  has_many :collected_resume, through: :mycollects, source: :resume

  def is_apply_job?(job)
    apply_job.include?(job )
  end
  def apply_join!(job)
    apply_job << job
  end

  def cancel_join!(job)
    apply_job.delete(job)
  end

  def is_employ_it?(resume)
    who_i_want.include?(resume)
  end

  def employ_it!(resume)
    who_i_want << resume
  end

  def cancel_employ!(resume)
    who_i_want.delete(resume)
  end

  def is_collected_job?(job)
    collected_job.include?(job)
  end

  def is_collected_resume?(resume)
    collected_resume.include?(resume)
  end

  def collect_job!(job)
    collected_job << job
  end

  def cancel_collect_job!(job)
    collected_job.delete(job)
  end

  def collect_resume!(resume)
    collected_resume << resume
  end

  def cancel_collect_resume!(resume)
    collected_resume.delete(resume)
  end

  def admin?
    is_admin
  end


  private
    def aavatar_size_validation
      errors[:aavatar] << "should be less than 900KB" if aavatar.size > 2.megabytes
    end
end
