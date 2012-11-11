class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy]

  
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

  def new
    @artist = Artist.new
    @tier = tier_radio(@artist)
    render :layout => "dashboard"
  end

  def create
    @artist = Artist.new(params[:artist])

    
    if @artist.save
      redirect_to artists_dashboard_index_url, notice: 'Artist was successfully created.'
    else
      @tier = tier_radio(@artist)
      render action: "new", :layout => "dashboard" 
    end
  
  end

  def edit
    @artist = Artist.find(params[:id])
    @tier = tier_radio(@artist)
    render :layout => "dashboard"
  end

  def update
    @artist = Artist.find(params[:id])
    uploader = ArtistImageUploader.new
    uploader.store!(params[:image])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to artists_dashboard_index_url, notice: 'Artist was successfully updated.' }
      else
        format.html { render action: "edit", :layout => 'dashboard' }
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

  def tier_radio(artist)
    tier = []
    [1, 2, 3].each do |t|
      if(artist.tier == t)
        tier[t] = "checked"
      else
        tier[t] = ""
      end
    end
    tier
  end

  def store_front_page_artists()
    #debugger
    #clear out old selections

    Artist.where("front_page != ?", 0) do |artist|
      debugger
      artist.front_page = 0
      artist.save
    end
    params[:artists].each_pair do |display_order, artist_id|
      artist = Artist.find(artist_id.first.to_i)
      artist.front_page = display_order.to_i
      artist.save!
    end
    respond_to do |format|
      format.json { render :json => "Saved"}
    end
  end

end
