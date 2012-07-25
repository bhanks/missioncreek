require 'test_helper'

class Dashboard::VenuesControllerTest < ActionController::TestCase
  setup do
    @dashboard_venue = dashboard_venues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dashboard_venues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dashboard_venue" do
    assert_difference('Dashboard::Venue.count') do
      post :create, dashboard_venue: { address: @dashboard_venue.address, name: @dashboard_venue.name, url: @dashboard_venue.url }
    end

    assert_redirected_to dashboard_venue_path(assigns(:dashboard_venue))
  end

  test "should show dashboard_venue" do
    get :show, id: @dashboard_venue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dashboard_venue
    assert_response :success
  end

  test "should update dashboard_venue" do
    put :update, id: @dashboard_venue, dashboard_venue: { address: @dashboard_venue.address, name: @dashboard_venue.name, url: @dashboard_venue.url }
    assert_redirected_to dashboard_venue_path(assigns(:dashboard_venue))
  end

  test "should destroy dashboard_venue" do
    assert_difference('Dashboard::Venue.count', -1) do
      delete :destroy, id: @dashboard_venue
    end

    assert_redirected_to dashboard_venues_path
  end
end
