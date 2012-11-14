class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy]

  
  def index
    @artists = Artist.all
    @sorted = {
      "1"=> { "col1" => [], "col2" => [], "col3" => [], "rem"=>[] },
      "2"=> { "col1" => [], "col2" => [], "col3" => [], "rem"=>[] },
      "3"=> { "col1" => [], "col2" => [], "col3" => [], "rem"=>[] }
    }
    
    #To keep the three columns of even length, determine when an artist should go into the 'rem' array
    breakpoint = {"1"=>nil, "2"=>nil, "3"=>nil}
    [1,2,3].each do |tier|
      length = Artist.count(:conditions => "tier = #{tier}")
      bp = length - (length % 3)
      breakpoint[tier.to_s] = bp
    end
    #Save myself from a case statement while keeping sensible column numbers for css/js, map display_order%3 to column number 
    column_map = {"1"=>"1", "2"=>"2", "0"=>"3"}
    
    @artists.each do |artist|
      tier = artist.tier.to_s
      
      if(@sorted[tier]["col1"].length + @sorted[tier]["col2"].length + @sorted[tier]["col3"].length != breakpoint[tier] )    
        column = column_map[(artist.display_order%3).to_s]
        @sorted[tier]["col#{column}"] << artist
      else
        @sorted[tier]['rem'] << artist
      end
    end
    

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

end
