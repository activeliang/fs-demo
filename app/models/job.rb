class Job < ApplicationRecord
  mount_uploader :cp_image, CpImageUploader
  has_many :cp_photos
  accepts_nested_attributes_for :cp_photos
  belongs_to :user
  has_many :cp_products
  has_many :cp_managers
  has_many :jb_labels
end
