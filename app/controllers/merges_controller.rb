class MergesController < ApplicationController

  def show
    @merge = Merge.find(params[:id])
    @first_image = Photo.find(@merge.first_image)
    @second_image = Photo.find(@merge.second_image)
  end

  def index
    @merges = Merge.order("created_at DESC").all
  end
end