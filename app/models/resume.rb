class Resume < ApplicationRecord
  mount_uploader :app_image, AppImageUploader
  has_many :photos
  accepts_nested_attributes_for :photos
  belongs_to :user

  has_many :resume_relationships
  has_many :want_to_me,through: :resume_relationships, source: :user
end
