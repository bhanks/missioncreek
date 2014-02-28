class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :authenticate_user!, :except => [:index, :show, :interim_events, :tech_schedule]
  def index
    @events = {} 
    days = {
      "monday" => Date.parse("31/03/2014"),
      "tuesday" => Date.parse("01/04/2014"),
      "wednesday" => Date.parse("02/04/2014"),
      "thursday" => Date.parse("03/04/2014"),
      "friday" => Date.parse("04/04/2014"),
      "saturday" => Date.parse("05/04/2014"),
      "sunday" => Date.parse("06/04/2014")
    }
    
    days.each_key do |key|
      @events[key] = Event.where(:date => days[key],:visible=>true).tagged_with("tech",:exclude=>true).order(:door_time)
    end

    respond_to do |format|
      format.html {render :layout =>"application"}
      format.json {
        @events = Event.where(:visible=>true).tagged_with("tech",:exclude=>true).order(:date, :door_time)
      } 
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html {render :layout =>"schedule"}
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    
    render :layout => "dashboard"
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @headliners = Artist.where("event_id = ? and headliner = ?", @event.id, true).order(:event_order)
    @support = Artist.where("event_id = ? and headliner = ?", @event.id, false).order(:event_order)
    render :layout => "dashboard"
  end

  # POST /events
  # POST /events.json
  def create
    params[:event].parse_time_select! :start_time
    params[:event].parse_time_select! :door_time

    @event = Event.new(params[:event].except(:category))
    @event.category_list = params[:event][:category]
    associate_artists(params[:headliners], @event, true) if params[:headliners]
    associate_artists(params[:support], @event) if params[:support]

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_dashboard_index_url, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new", :layout => 'dashboard' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    params[:event].parse_time_select! :start_time
    params[:event].parse_time_select! :door_time
    @event = Event.find(params[:id])

    if params[:event] && params[:event][:category]
      @event.category_list = params[:event][:category]
    end

    associate_artists(params[:headliners], @event, true) if params[:headliners]
    associate_artists(params[:support], @event) if params[:support]

    current_list = []
    current_list.concat(params[:headliners].keys) if params[:headliners]
    current_list.concat(params[:support].keys) if params[:support]

    removed_artists = Artist.where("event_id = ?", @event.id)
    removed_artists = removed_artists.where("id NOT IN (?)", current_list) unless current_list.empty?

    removed_artists.each do |artist|
      artist.event = nil
      artist.save!
    end 
    respond_to do |format|
      if @event.update_attributes(params[:event].except(:category))
        format.html { redirect_to events_dashboard_index_url, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", :layout => 'dashboard' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_dashboard_index_url }
      format.json { head :no_content }
    end
  end

  def interim_events
    render :layout => "interim"
  end

  def associate_artists(artists, event, headliner = false)
    artists.keys.each do |artist_id|
      artist = Artist.find(artist_id)
      artist.event = event
      artist.event_order = artists[artist_id]
      artist.headliner = headliner
      artist.save!
    end
  end

  def tech_schedule
    days = {
      "friday" => Date.parse("04/04/2014"),
      "saturday" => Date.parse("05/04/2014")
    }
    @events = {}
    @events["friday"] = Event.where(:date=>days["friday"]).tagged_with("tech").order("date, door_time")
    @events["saturday"] = Event.where(:date=>days["saturday"]).tagged_with("tech").order("date, door_time")
  end

end
