class MergesController < ApplicationController

  before_filter :find_merge, :except => :index
  before_filter :authenticate_user!, :only => [:like]

  def find_merge
    @merge = Merge.find(params[:id])
  end

  def show
    @first_image = Photo.find(@merge.first_image)
    @second_image = Photo.find(@merge.second_image)
  end

  def like
    @merge.liked_by current_user
    redirect_to @merge
    flash[:notice]="Liked!"
  end
  def unlike
    @merge.unliked_by current_user
    redirect_to @merge
    flash[:notice]="Unliked!"
  end

  def index
    params[:order] ||= "cached_votes_score"
    @merges = Merge.order("#{params[:order]} DESC").page(params[:page]).per(9)
  end
end