class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    if params[:player]
      @player = Player.find(params[:player])
    end
  end

  def join
    @match = Match.find(params[:id])
    @player = Player.find(params[:player])
    @match.players << @player
    if @match.save
      render 'show'
    else
      # TODO: show proper error message
      render plain: @match.errors
    end
  end

  # TODO: add background job for sending emails and remove this debugging endpoint
  def send_mail
    player = Player.find_by_email(params[:email])
    match = Match.find(params[:match])
    render plain: MatchMailer.match_reminder_email(match, player).deliver_now
  end

end
