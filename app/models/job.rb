class Job < ApplicationRecord
  mount_uploader :cp_image, CpImageUploader

  belongs_to :user
end
