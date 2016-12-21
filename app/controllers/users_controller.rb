class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @games = @user.games.paginate(:page => params[:page], per_page: 5)
  end
end
