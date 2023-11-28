class TopController < ApplicationController
  def main
    if current_user != nil
      redirect_to tweets_path
    else
      render "login"
    end
  end
  
  def login_move
    render "login"
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    else
      render "error"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to users_path
  end

end
