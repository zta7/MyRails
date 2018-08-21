class UserController < ApplicationController
  def show 
    @users = User.limit(10)
  end
end
