require 'test_helper'

class PlayersControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get show" do
    player = Player.create({ name: 'Show Player', email: 'show@player.com' })
    get :show, { id:  player.id }
    assert_response :success
    assert_not_nil assigns(:player)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:player)
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { name: 'Rud Gullit', email: 'rud@gullit.com' }
    end
    assert_redirected_to player_path(assigns(:player))
  end

end
