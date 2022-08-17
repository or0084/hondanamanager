class ApplicationController < ActionController::Base

  def autheniticate_user
    if current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to user_session_path
    end
  end
end
