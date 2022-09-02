class ApplicationController < ActionController::Base

  def confirm_logged_in
    unless session[:id]
      redirect_to root_path
    end
  end

end
