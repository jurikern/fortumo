class ProfilesController < ApplicationController
  include ApplicationHelper
  
  before_filter :authenticate_user!
    
  def show
    if params[:id]
      @user = User.find_by_id(params[:id])
      
      if @user.id == current_user.id
        redirect_to('/me')
      end
    else
      @user = current_user
    end
      
    @user || not_found  
    
    if current_user == @user
      @title = "My Profile"
    else
      @title = "#{@user.username.titleize} - Profile"
    end
  end
  
  def edit
    @user = current_user 
    @user.username = "#{@user.username.titleize}" 
    
    @title = "#{@user.username} Settings"
  end
  
  def update
    @user = current_user
    
    @user || not_found
    
    if @user.update_with_password(params[:user])
      flash[:notice] = "Data successful updated."
      sign_in @user, :bypass => true
      redirect_to '/settings'
    else
      @title = "Settings"
      render :edit
    end
  end
end
