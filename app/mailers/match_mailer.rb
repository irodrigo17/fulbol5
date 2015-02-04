class MatchMailer < ApplicationMailer

  def match_reminder_email(match, player)
    @match = match
    @player = player
    @url = "http://localhost:3000/matches/#{match.id}/join?player=#{player.id}"
    mail(to: player.email, subject: 'Futbol 5')
  end

end
