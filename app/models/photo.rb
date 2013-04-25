class Photo < ActiveRecord::Base
  attr_accessible :description, :url, :user_id
  belongs_to :user

  mount_uploader :url, PhotoUploader

  after_create :new_merged_photo

  def new_merged_photo
    Merge.create(
        :first_image => self.id,
        :second_image => Photo.last(2).first.id,
        :blend_mode  => "overlay"
    )
  end
end