class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice]= "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."
      redirect_to new_session_path(:user)
    else
      include_signup_title
      
      flash.now[:alert] = "#{count_errors_for(@user)} prohibited this user from being saved."
      render :action => :new
    end
  end
  
  def new
    include_signup_title
    super
  end
  
  def update
    super
  end
  
  private
    
    def include_signup_title
      unless @title
        @title = "Sign up"  
      end
    end
end
