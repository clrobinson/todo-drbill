class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session['user_id'] = @user.id
      render 'sessions/sign_in'
    else
      render 'create_error'
    end
  end

  protected

    def user_params
      params.require(:user).permit(:name, :password)
    end
  
end
