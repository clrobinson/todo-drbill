class SessionsController < ApplicationController

  def sign_in
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session['user_id'] = @user.id
    else
      render 'sign_in_error'
    end
  end

  def sign_out
    session['user_id'] = nil
  end
  
end
