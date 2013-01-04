class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json

  before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy]

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    render :layout => "dashboard"
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    render :layout => "dashboard"
  end

  # POST /posts
  # POST /posts.json
  def create
    debugger
    @post = Post.new(params[:post])

    # if format == "html"
    #   if @post.save
    #     redirect_to posts_dashboard_index_url, notice: 'Post was successfully created.'
    #   else
    #     render action: "new" 
    #   end
    # elsif format == "json"
    if @post.save
      render json: @post
    end
    
      
    
  end


  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])


    if @post.update_attributes(params[:post])
      redirect_to posts_dashboard_index_url, notice: 'Post was successfully updated.' 

    else
      render action: "edit"
    end
  
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_dashboard_index_url

  end
end
