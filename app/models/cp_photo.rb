class CpPhoto < ApplicationRecord
  mount_uploader :cp_in_image, CpInImageUploader
   belongs_to :job
end
