class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params.require(:player).permit(:name, :email))
    if @player.save
      redirect_to @player
    else
      render 'new'
    end
  end

end
