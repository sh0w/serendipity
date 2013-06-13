class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order("created_at DESC")
    @merges = Merge.where("first_image IN (?) OR second_image IN (?) ", @photos, @photos).order("created_at DESC").page(params[:page]).per(20)
    @photos = @photos.order("created_at DESC").page(params[:page]).per(20)
    @likes = @user.find_voted_items.first(20)

    @activities = PublicActivity::Activity.where(:owner_id => @user.id).order("created_at desc")
  end
end
