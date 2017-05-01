class Resume < ApplicationRecord
  mount_uploader :wechatimg, WechatimgUploader
  mount_uploader :app_image, AppImageUploader
  mount_uploader :wmf, WmfUploader
  mount_uploader :wms, WmsUploader
  has_many :tags
  has_many :photos
  accepts_nested_attributes_for :photos
  belongs_to :user

  has_many :resume_relationships
  has_many :want_to_me,through: :resume_relationships, source: :user

  has_many :mycollects
  has_many :collected_resume, through: :mycollects, source: :user
end
