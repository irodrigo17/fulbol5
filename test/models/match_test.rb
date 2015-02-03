require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "add player by email" do
    match = Match.first
    player = Player.first
    match.add_player(player.email)
    assert match.players.count == 1
    assert match.players[0] == player
  end
end
