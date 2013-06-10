class SimpleEventsController < ApplicationController
  # GET /simple_events
  # GET /simple_events.json
  before_filter :authenticate_user!, :except => [:index, :show, :interim]
  def index
    @simple_events = SimpleEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simple_events }
    end
  end

  # GET /simple_events/1
  # GET /simple_events/1.json
  def show
    @simple_event = SimpleEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simple_event }
    end
  end

  # GET /simple_events/new
  # GET /simple_events/new.json
  def new
    @simple_event = SimpleEvent.new
    render :layout => "dashboard"
  end

  # GET /simple_events/1/edit
  def edit
    @simple_event = SimpleEvent.find(params[:id])
    render :layout => "dashboard"
  end

  # POST /simple_events
  # POST /simple_events.json
  def create
    @simple_event = SimpleEvent.new(params[:simple_event])

    respond_to do |format|
      if @simple_event.save
        format.html { redirect_to @simple_event, notice: 'Simple event was successfully created.' }
        format.json { render json: @simple_event, status: :created, location: @simple_event }
      else
        format.html { render action: "new", :layout => 'dashboard' }
        format.json { render json: @simple_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simple_events/1
  # PUT /simple_events/1.json
  def update
    @simple_event = SimpleEvent.find(params[:id])

    respond_to do |format|
      if @simple_event.update_attributes(params[:simple_event])
        format.html { redirect_to @simple_event, notice: 'Simple event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", :layout => 'dashboard' }
        format.json { render json: @simple_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_events/1
  # DELETE /simple_events/1.json
  def destroy
    @simple_event = SimpleEvent.find(params[:id])
    @simple_event.destroy

    respond_to do |format|
      format.html { redirect_to simple_events_dashboard_index_url }
      format.json { head :no_content }
    end
  end


end
