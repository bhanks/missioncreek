class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end
  end

  def new
    @venue = Venue.new
    render :layout => "dashboard"
  end

  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        format.html { redirect_to venues_dashboard_index_url, notice: 'Venue was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @venue = Venue.find(params[:id])
    render :layout => "dashboard"
  end

  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to venues_dashboard_index_url, notice: 'Venue was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_dashboard_index_url }
    end
  end

  
end
