class Job < ApplicationRecord

  belongs_to :user

  has_many :job_relationships
  has_many :applicant, through: :job_relationships, source: :user



end
