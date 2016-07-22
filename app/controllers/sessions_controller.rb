class UsersController < ApplicationController

  def sign_in
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session['user_id'] = @user.id
    else
      render 'sign_in_error'
    end
  end

  def sign_out
  end
  
end
