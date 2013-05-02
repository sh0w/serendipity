class MergesController < ApplicationController

  def show
    @merge = Merge.find(params[:id])
  end

  def index
    @merges = Merge.all
  end
end