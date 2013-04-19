class Photo < ActiveRecord::Base
  attr_accessible :description, :url, :user_id
  belongs_to :user

  mount_uploader :url, PhotoUploader
end