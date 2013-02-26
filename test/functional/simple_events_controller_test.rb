require 'test_helper'

class SimpleEventsControllerTest < ActionController::TestCase
  setup do
    @simple_event = simple_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simple_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simple_event" do
    assert_difference('SimpleEvent.count') do
      post :create, simple_event: { date: @simple_event.date, description: @simple_event.description, free: @simple_event.free, image: @simple_event.image, price: @simple_event.price, soldout: @simple_event.soldout, start: @simple_event.start, ticket_url: @simple_event.ticket_url, title: @simple_event.title, type: @simple_event.type, venue_id: @simple_event.venue_id }
    end

    assert_redirected_to simple_event_path(assigns(:simple_event))
  end

  test "should show simple_event" do
    get :show, id: @simple_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simple_event
    assert_response :success
  end

  test "should update simple_event" do
    put :update, id: @simple_event, simple_event: { date: @simple_event.date, description: @simple_event.description, free: @simple_event.free, image: @simple_event.image, price: @simple_event.price, soldout: @simple_event.soldout, start: @simple_event.start, ticket_url: @simple_event.ticket_url, title: @simple_event.title, type: @simple_event.type, venue_id: @simple_event.venue_id }
    assert_redirected_to simple_event_path(assigns(:simple_event))
  end

  test "should destroy simple_event" do
    assert_difference('SimpleEvent.count', -1) do
      delete :destroy, id: @simple_event
    end

    assert_redirected_to simple_events_path
  end
end
