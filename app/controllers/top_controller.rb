class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    logger.debug params[:uid]
    if params[:uid] == "kindai" and params[:pass] == "sanriko"
      session[:login_uid] = params[:uid]
      redirect_to top_main_path
    end
  end
end
