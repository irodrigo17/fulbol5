class Player < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :match_players
  has_many :matches, :through => :match_players
end
