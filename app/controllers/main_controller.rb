class MainController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to "/sign-in"
    else
      redirect_to "/me"
    end
  end
end
