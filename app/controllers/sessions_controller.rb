class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(account_id: params[:session][:account_id])
    if user&.authenticate(params[:session][:password])
      login user
      redirect_to root_path
    else
      flash.now[:alert] = 'アカウントID、またはパスワードが間違っています。'
      render :new
    end
  end
end