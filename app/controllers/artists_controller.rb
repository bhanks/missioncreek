class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  #before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @artists = Artist.all
    @meta_title = "Lineup : "
    @tier1 = Artist.where(:tier=>1).order("display_order")
    @tier2 = Artist.where(:tier=>2).order("display_order")
    @tier3 = Artist.where(:tier=>3).order("created_at")
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @no_dates = true
    @meta_title = @artist.name + " @ "
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

  def match_artists_with_events
    @artists = Artist.all

    render "match", :layout => "dashboard"
  end

  def update_artists_events
    @artists = Artist.find(params[:artist_ids])
    render "update_with_event", :layout =>"dashboard"
  end

  def update_events
    @artists = Artist.find(params[:artist_ids])
    headliners = params[:headliner_ids].map(&:to_i)
    @artists.each do |artist|
      artist.event_id = params[:artist][:event_id]
      if(headliners.include?(artist.id))
        artist.headliner = true
      end
      artist.save!
    end
    redirect_to artists_dashboard_index_url
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
  def store_display_order()
    #debugger

    params[:artists].each_pair do |display_order, artist_id|
      artist = Artist.find(artist_id.first.to_i)
      artist.display_order = display_order.to_i
      artist.save!
    end
    respond_to do |format|
      format.json { render :text => "Saved"}
    end
  end

  def artist_thumb()
    artist = Artist.find(params[:id]).first
    
    thumbnail = artist.image.thumb.to_s
    respond_to do |format|
      format.json { render :text => thumbnail }
    end
  end

end
