class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @pages = page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])
    @children = Page.children(@page.id)
    @meta_title = @page.title + ":"
    if(@page.parent)
      parent = Page.find(@page.parent)
      @splash_image = parent.splash_image
    else
      @splash_image = @page.splash_image
    end
    @no_dates = true
    if request.path != page_path(@page)
      redirect_to @page, status: :moved_permanently
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
    @pages = Page.all
    render :layout => "dashboard"
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    @pages = Page.all_except(@page.id)
    render :layout => "dashboard"
  end

  # page /pages
  # page /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_dashboard_index_url, notice: 'Page was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
    
      
    
  end


  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])


    if @page.update_attributes(params[:page])
      redirect_to pages_dashboard_index_url, notice: 'page was successfully updated.' 

    else
      render action: "edit"
    end
  
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.where("slug = ?",params[:id]).first
    @page.destroy
    @pages = Page.all
    #render :json => true
    redirect_to "dashboard/pages"
  end
end
