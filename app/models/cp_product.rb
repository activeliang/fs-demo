class CpProduct < ApplicationRecord
  belongs_to :job
  mount_uploader :product_image, ProductImageUploader
end
