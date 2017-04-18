class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :jobs
  has_many :job_relationships
  has_many :apply_job, through: :job_relationships, source: :job
  has_many :resume_relationships
  has_many :who_i_want, through: :resume_relationships, source: :resume

  def is_apply_job?(job)
    apply_job.include?(job )
  end
  def apply_join!(job)
    apply_job << job
  end

  def cancel_join!(job)
    apply_job.delete(job)
  end
end
