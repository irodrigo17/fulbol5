class MatchPlayer < ActiveRecord::Base

  belongs_to :match
  belongs_to :player

  validates :player, uniqueness: { scope: :match, message: "should join only once" }

end
