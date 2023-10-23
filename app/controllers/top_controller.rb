class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user != nil
      if BCrypt::Password.new(user.pass) == params[:pass]
        session[:login_uid] = params[:uid]
        redirect_to top_main_path
      else
        render "error"
      end
    else
      render "error"
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end

  def newuser
    render "newuser"
  end

  def saveuser
    #uidの存在チェック
    if User.find_by(uid: params[:uid])
      #あったら、既に登録済みエラー画面
      render "exist_error"
    else
      #なかったら、パスワードの暗号化、User.Create（）、登録完了画面
      User.create(uid: params[:uid], pass: BCrypt::Password.create(params[:pass]))
      render "registered"
    end
  end
end
