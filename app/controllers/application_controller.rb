class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :nav_paths
  def nav_paths
	@nav_paths = {}
	@nav_paths[:about] = (Page.exists?(:title=>"About")) ? Rails.application.routes.url_helpers.page_path(Page.where("title = ?", "About").first) : "javascript:void(0)"
	@nav_paths[:lit] = (Page.exists?(:title=>"Literature")) ? Rails.application.routes.url_helpers.page_path(Page.where("title = ?", "Literature").first) : "javascript:void(0)"
	@nav_paths[:food] = (Page.exists?(:title=>"Food")) ? Rails.application.routes.url_helpers.page_path(Page.where("title = ?", "Food").first) : "javascript:void(0)"
	@nav_paths[:residency] = (Page.exists?(:title=>"Artist Residency")) ? Rails.application.routes.url_helpers.page_path(Page.where("title = ?", "Artists Residency").first) : "javascript:void(0)"
	@nav_paths[:schedule] = (Page.exists?(:title=>"Schedule")) ? Rails.application.routes.url_helpers.page_path(Page.where("title = ?", "Schedule").first) : "javascript:void(0)"
  end

end
