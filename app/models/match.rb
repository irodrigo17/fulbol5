class Match < ActiveRecord::Base

  validates :date, presence: true, uniqueness: true
  validates :place, presence: true

  has_many :match_players, -> { order('match_players.created_at ASC') }, :dependent => :destroy
  has_many :players, :through => :match_players

end
