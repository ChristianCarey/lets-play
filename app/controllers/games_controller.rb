class GamesController < ApplicationController
  def index
    @user  = User.find(params[:user_id])
    @games = @user.games.all
  end

  def new
  end
end
