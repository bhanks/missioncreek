class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  #before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    unless params[:invisible]
      @artists = Artist.where(:visible=>true).order("display_order")
    else
      @artists = Artist.order("display_order")
    end
    if(params[:with_event])
      @artists = @artists.where("event_id IS NOT NULL");
    end
    @lineup="active"
    @meta_title = "Lineup : "
    # @tier1 = Artist.where(:tier=>1).order("display_order")
    # @tier2 = Artist.where(:tier=>2).order("display_order")
    # @tier3 = Artist.where(:tier=>3).order("created_at")
     

    respond_to do |format|
      format.html # index.html.erb
      format.json  
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @no_dates = true
    @meta_title = @artist.name + " @ "
    respond_to do |format|
      format.html # show.html.erb
      format.json 
    end
  end

  def new
    @artist = Artist.new
    render :layout => "dashboard"
  end

  def create
    @artist = Artist.new(params[:artist].except(:category))
    @artist.category_list = params[:artist][:category]

    
    if @artist.save
      if params[:artist][:image]
        img = ::Magick::Image::read(@artist.image).first 
        width = img.columns
        height = img.rows
        unless(height <= 300 || width <= 450)
          redirect_to action: "crop", :id => @artist.id
        else
          @artist.remove_image!
          @artist.save!
          @artist.errors.add :image, "must be at least 450x300"
          render action: "new", :layout => "dashboard" 
        end
      else
        redirect_to artists_dashboard_index_url, notice: 'Artist was successfully created.'
      end 
    else
      render action: "new", :layout => "dashboard" 
    end
  
  end

  def edit
    @artist = Artist.find(params[:id])
    render :layout => "dashboard"
  end

  def update
    @artist = Artist.find(params[:id])
    uploader = ArtistImageUploader.new
    uploader.store!(params[:image])
    if(params[:crop])
      @artist.crop_x = params[:crop][:x1]
      @artist.crop_y = params[:crop][:y1]
      @artist.crop_w = params[:crop][:w]
      @artist.crop_h = params[:crop][:h]
    end
    if params[:artist] && params[:artist][:category]
      @artist.category_list = params[:artist][:category]
    end
    respond_to do |format|
      if params[:artist]
        if @artist.update_attributes(params[:artist].except(:category))
          if params[:artist][:image]
            img = ::Magick::Image::read(@artist.image).first 
            width = img.columns
            height = img.rows
            unless(height <= 300 || width <= 450)
              format.html {redirect_to action: "crop", :id => @artist.id}
            else
              @artist.remove_image!
              @artist.save!
              @artist.errors.add :image, "must be at least 450x300"
              format.html{ render action: "new", :layout => "dashboard"}
            end
          else
            format.html { redirect_to artists_dashboard_index_url, notice: 'Artist was successfully updated.' }
          end
        else
          format.html { render action: "edit", :layout => 'dashboard' }
        end
      elsif params[:crop]
        format.html { redirect_to artists_dashboard_index_url, notice: 'Artist was successfully updated.' }
      end
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_dashboard_index_url }
    end
  end


  def crop
    @artist = Artist.find(params[:id])
    render :layout => "dashboard"
  end

  

  def store_front_page_artists()
    #debugger
    #clear out old selections

    Artist.where("front_page != ?", 0).each do |artist|
      artist.front_page = 0
      artist.save
    end
    params[:artists].each_pair do |display_order, artist_id|
      artist = Artist.find(artist_id.first.to_i)
      artist.front_page = display_order.to_i
      artist.save!
    end
    respond_to do |format|
      format.json { render :text => "Saved"}
    end
  end

  def lineup_order
    @artists = Artist.where("display_order IS NOT NULL").order("display_order") + Artist.where("display_order IS NULL")
    render :layout => "dashboard"
  end

  def update_order
    params[:artist].each_pair do |id, value|
      artist = Artist.find(id)
      artist.display_order = value
      artist.save!
    end
    redirect_to dashboard_index_path, notice: 'Lineup Order was successfully updated.' 
  end

  def artist_thumb()
    artist = Artist.find(params[:id]).first
    
    thumbnail = artist.image.thumb.to_s
    respond_to do |format|
      format.json { render :text => thumbnail }
    end
  end

end
