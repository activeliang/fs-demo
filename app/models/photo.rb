class Photo < ApplicationRecord

  mount_uploader :avatar, AvatarUploader
  belongs_to :resume
end
