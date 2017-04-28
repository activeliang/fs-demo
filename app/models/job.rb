class Job < ApplicationRecord
  mount_uploader :cp_image, CpImageUploader

  belongs_to :user
  has_many :cp_products
  has_many :cp_managers
  has_many :jb_labels
end
