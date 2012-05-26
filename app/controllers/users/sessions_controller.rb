class Users::SessionsController < Devise::SessionsController
  def new
    include_signin_title
    super
  end
  
  def create
    include_signin_title
    super  
  end
  
  private
  
    def include_signin_title
      unless @title
        @title = "Sign in"
      end
    end
end