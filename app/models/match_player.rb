class MatchPlayer < ActiveRecord::Base
  # TODO: cascade deletes
  belongs_to :match
  belongs_to :player
end
