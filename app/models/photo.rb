require 'file_size_validator'
class Photo < ActiveRecord::Base
  attr_accessible :description, :url, :user_id
  belongs_to :user

  has_many :merges, :foreign_key => 'first_image'

  mount_uploader :url, PhotoUploader
  validates_presence_of :url, :message => "Please select a photo that you would like to merge."

  validates :url,
            :file_size => {
                :maximum => 5.megabytes.to_i
            }

  after_commit :new_merged_photo

  def new_merged_photo
    require "carrierwave/processing/rmagick"

    source = Magick::Image.read("public/uploads/photo/#{self.id}/#{self.url.file.filename}").first

    source = source.resize_to_fill(500, 500).contrast(true)

    # if only one photo exists --> photo should be merged with itself
    overlay_photo = Photo.count < 2 ? self : Photo.last(2).first

    overlay = Magick::Image.read("public/uploads/photo/#{overlay_photo.id}/#{overlay_photo.url.file.filename}").first
    overlay = overlay.resize_to_fill(500, 500)

    source.composite!(overlay, 0, 0, getMergeFunction)

    m = Merge.create!(
        :first_image => self.id,
        :second_image => Photo.last(2).first.id,
        :blend_mode  => "overlay"
    )

    puts m.inspect
    puts "---------"

    url= "uploads/merge/#{m.id}.jpg"
    source.write("public/"+url)

    m.url = url
    m.save!

    puts m.inspect
    puts "---------"
  end

  def getMergeFunction
    mergeFunctions = Array.new
    mergeFunctions.push(Magick::OverlayCompositeOp, Magick::ScreenCompositeOp, Magick::MultiplyCompositeOp, Magick::DarkenCompositeOp, Magick::LightenCompositeOp, Magick::HardLightCompositeOp)
    mergeFunctions.sample
  end

end