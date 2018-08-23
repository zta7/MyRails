class UserController < ApplicationController

  before_action :authenticate_user！

  def index
    @users = User.all
  end
  def show
    @users = User.limit(10)
  end
end
