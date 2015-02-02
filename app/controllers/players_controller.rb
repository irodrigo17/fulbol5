class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def new
  end

  def create
    @player = Player.new(params.require(:player).permit(:name, :email))
    @player.save
    redirect_to @player
  end

end
