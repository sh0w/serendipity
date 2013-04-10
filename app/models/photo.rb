class Photo < ActiveRecord::Base
  attr_accessible :description, :url, :user_id

  mount_uploader :url, PhotoUploader
end
