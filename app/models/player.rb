class Player < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :match_players, -> { order('match_players.created_at ASC') }, :dependent => :destroy
  has_many :matches, :through => :match_players

end
