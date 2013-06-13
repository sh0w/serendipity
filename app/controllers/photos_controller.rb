class PhotosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = current_user.id

    puts "--- save photo --- "
    puts @photo.inspect
    puts "--- save photo --- "

    respond_to do |format|
      if @photo.save
        #@photo.create_activity key: 'merge.created', owner: current_user

        puts "--- save photo --- "
        puts @photo.inspect
        puts "--- save photo --- "

        @merge = Merge.where(:first_image => @photo.id).first
        format.html { redirect_to merge_path(@merge), notice: 'Photo was successfully created.' }
        format.json { render json: @merge, status: :created, location: @merge }
      else
        format.html { render action: "new", warning: "nono" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
