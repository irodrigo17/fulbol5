require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  test "validates name presence" do
    player = Player.create
    assert player.invalid?
    assert player.errors[:name].any?
    assert player.errors[:name] == ["can't be blank"]
  end

  test "validates name uniqueness" do
    player1 = Player.create({name: "player1", email: "player1@example.com"})
    assert player1.valid?

    player2 = Player.create({name: "player1", email: "player2@example.com"})
    assert player2.invalid?
    assert player2.errors[:name].any?
    assert player2.errors[:name] == ["has already been taken"]
  end

  test "validates email presence" do
    player = Player.create
    assert player.invalid?
    assert player.errors[:email].any?
    assert player.errors[:email] == ["can't be blank"]
  end

  test "validates email uniqueness" do
    player1 = Player.create({name: "player1", email: "player1@example.com"})
    assert player1.valid?

    player2 = Player.create({name: "player2", email: "player1@example.com"})
    assert player2.invalid?
    assert player2.errors[:email].any?
    assert player2.errors[:email] == ["has already been taken"]
  end

  # TODO: validate email format

  test "matches are sorted by join date" do
    matches = Match.all

    player = Player.create({name: "Juan Pedro Fasola", email: "nuestro@granamigo.com"})
    assert player.valid?
    player.matches << matches
    player.save
    assert player.matches.length == matches.length

    player = Player.find(player.id)
    assert !player.nil?
    assert player.matches.length == matches.length
    assert player.matches.pluck(:date) == matches.pluck(:date)
  end

  test "cascade player associations delete" do
    match = Match.create({date: "2018-07-08T19:00:00", place: "River"})
    assert match.valid?

    player = Player.create({name: "John Doe", email: "jdoe@example.com"})
    assert !player.nil?
    player.matches << match
    player.save
    assert player.valid?
    assert player.matches.length == 1

    match_player = MatchPlayer.where(player: player, match: match).take
    assert !match_player.nil?

    player_id = player.id
    player.destroy
    match = Match.find(match.id)
    assert !match.nil? # sanity check
    match_player = MatchPlayer.where(player: player_id, match: match).take
    assert match_player.nil?
  end

end
