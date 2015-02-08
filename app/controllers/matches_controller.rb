class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    if params[:player_id]
      @player = Player.find(params[:player_id])
    end
  end

  def join
    match = Match.find(params[:match_id])
    player = Player.find(params[:player_id])
    if !match.players.include? player
      match.players << player
      match.save
    end
    redirect_to match
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(params.require(:match).permit(:date, :place))
    if @match.save
      redirect_to @match
    else
      render 'new'
    end
  end

  # TODO: add background job for sending emails and remove this debugging endpoint
  def send_mail
    player = Player.find_by_email(params[:email])
    match = Match.find(params[:match])
    render plain: MatchMailer.match_reminder_email(match, player).deliver_now
  end

end
