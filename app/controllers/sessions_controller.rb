class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(name: params[:session][:login])
    if user && user.authenticate(params[:session][:password])

      sign_in user

      flash[:success] = 'Access granted'
      redirect_to '/bicycles'
    else
      flash.now[:error] = 'Неправильные логин/пароль'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
