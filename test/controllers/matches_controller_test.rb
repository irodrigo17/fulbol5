require 'test_helper'

class MatchesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get show" do
    match = Match.create({ date: DateTime.now, place: 'Show' })
    assert match.valid?
    player = Player.create({ name: 'Show Match', email: 'show@match.com' })
    assert player.valid?

    get :show, { id: match.id, player_id: player.id }

    assert_response :success
    assert_not_nil assigns(:match)
    assert_not_nil assigns(:player)
  end

  test "should join match" do
    match = Match.create({ date: DateTime.now, place: 'Join' })
    assert match.valid?
    player = Player.create({ name: 'Join Match', email: 'join@match.com' })
    assert player.valid?

    assert_difference('MatchPlayer.count') do
      get :join, { match_id: match.id, player_id: player.id }
    end

    assert_redirected_to match_path(match.id, assigns(:match))
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:match)
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { date: '2017-12-12T12:00:00', place: 'Parque Central' }
    end
    assert_redirected_to match_path(assigns(:match))
  end

end
