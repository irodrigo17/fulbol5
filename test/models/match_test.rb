require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  test "validates date presence" do
    match = Match.create
    assert match.invalid?
    assert match.errors[:date].any?
    assert match.errors[:date] == ["can't be blank"]
  end

  test "validates date uniqueness" do
    match1 = Match.create({date: "2010-10-10T10:10:10", place: "Estadio Centenario"})
    assert match1.valid?

    match2 = Match.create({date: "2010-10-10T10:10:10", place: "Estadio Centenario"})
    assert match2.invalid?
    assert match2.errors[:date].any?
    assert match2.errors[:date] == ["has already been taken"]
  end

  test "validates place presence" do
    match = Match.create
    assert match.invalid?
    assert match.errors[:place].any?
    assert match.errors[:place] == ["can't be blank"]
  end

  test "players are sorted by join date" do
    match = Match.create({date: "2015-1-1T17:00:00", place: "Maracana"})
    assert match.valid?
    players = Player.all.order(:email)
    assert players.length > 0
    players.each do |p|
      match.players << p
      match.save
      assert match.valid?
    end

    match = Match.find(match.id)
    assert !match.nil?
    assert match.players.length == players.length
    assert match.players.pluck(:email) == players.pluck(:email)
  end

  test "players can join only once" do
    match = Match.create({date: "2015-02-02T18:00:00", place: "La Bombonera"})
    assert match.valid?

    player = Player.first
    assert !player.nil?
    match.players << player
    match.save
    assert match.valid?
    assert match.players.length > 0

    match = Match.find(match.id)
    player = Player.find(player.id)
    assert !player.nil?
    assert_raises(ActiveRecord::RecordInvalid) { match.players << player }
  end

  test "cascade player associations delete" do
    match = Match.create({date: "2016-03-03T19:00:00", place: "Franzini"})
    assert match.valid?

    player = Player.first
    assert !player.nil?
    match.players << player
    match.save
    assert match.valid?
    assert match.players.length > 0

    match_player = MatchPlayer.where(player: player, match: match).take
    assert !match_player.nil?

    match_id = match.id
    match.destroy
    player = Player.find(player.id)
    assert !player.nil? # sanity check
    match_player = MatchPlayer.where(player: player, match: match_id).take
    assert match_player.nil?
  end

end
