class Match < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  validates :place, presence: true

  has_many :match_players
  has_many :players, :through => :match_players

  def add_player(player_email)
    player = Player.find_by_email(player_email)
    if player != nil
      players << player
    end
  end

end
