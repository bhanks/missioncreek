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

end
