class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @events = {}
    days = {
      "monday" => Date.parse("01/04/2013"),
      "tuesday" => Date.parse("02/04/2013"),
      "wednesday" => Date.parse("03/04/2013"),
      "thursday " => Date.parse("04/04/2013"),
      "friday " => Date.parse("05/04/2013"),
      "saturday " => Date.parse("06/04/2013"),
      "sunday " => Date.parse("07/04/2013")
    }
    
    days.each_key do |key|
      @events[key] = Event.where(:date => days[key]).order(:door_time)
    end

    respond_to do |format|
      format.html {render :layout =>"schedule"}
      format.json { render json: @events }
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

    render :layout => "dashboard"
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

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
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
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



end
