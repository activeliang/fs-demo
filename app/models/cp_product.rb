class CpProduct < ApplicationRecord
  validates :description, length: { maximum: 240 }
  has_many :product_labels
  belongs_to :job
  mount_uploader :product_image, ProductImageUploader
end
