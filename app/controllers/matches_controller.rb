class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def join
    @match = Match.find(params[:id])
    @match.add_player(params[:email])
    render 'show'
  end
end
