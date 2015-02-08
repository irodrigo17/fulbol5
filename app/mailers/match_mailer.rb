class MatchMailer < ApplicationMailer

  def match_reminder_email(match, player)
    @match = match
    @player = player

    @url = url_for(
      controller: 'matches',
      action: 'join',
      match_id: match.id,
      player_id: player.id,
      only_path: false
    )
    mail(to: player.email, subject: 'Futbol 5')
  end

end
