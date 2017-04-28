class CpManager < ApplicationRecord
  belongs_to :job
  mount_uploader :manager_image, ManagerImageUploader

end
