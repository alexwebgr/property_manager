class SessionsController < ApplicationController
  def login
    session[:current_user_id] = params[:id]
    redirect_to properties_url
  end
end
