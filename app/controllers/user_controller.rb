class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @photos = @user.photos
    puts @photos.inspect
    @merges = Array.new
    @photos.each do |photo|
      @merges.push Merge.where("first_image = ? OR second_image = ? ", photo.id, photo.id)
    end
  end
end
