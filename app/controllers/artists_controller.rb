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
    render :layout => "dashboard"
  end

  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        format.html { redirect_to artists_dashboard_index_url, notice: 'Artist was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    @tier = tier_radio(@artist)
    render :layout => "dashboard"
  end

  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to artists_dashboard_index_url, notice: 'Artist was successfully updated.' }
      else
        format.html { render action: "edit" }
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
end
