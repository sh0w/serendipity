class Merge < ActiveRecord::Base
  acts_as_votable

  attr_accessible :blend_mode, :first_image, :second_image, :url
  has_many :photos

  has_many :photos, :foreign_key => 'first_image'

  before_save :default_values
  def default_values
    self.url ||= ''
  end
end
