class MergesController < ApplicationController

  def show
    @merge = Merge.find(params[:id])
  end

end
