require 'test_helper'

class MatchMailerTest < ActionMailer::TestCase
  test "match reminder email" do
    match = Match.first
    assert_not_nil match
    player = Player.first
    assert_not_nil player
    assert MatchMailer.match_reminder_email(match, player).deliver_now
  end
end
