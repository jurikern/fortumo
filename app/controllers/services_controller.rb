class ServicesController < ApplicationController
  include ServicesHelper
  
  def index
    
  end
  
  def create
    omniauth = request.env["omniauth.auth"]
    
    provider, uid, email, username = omniauth_factory(omniauth)
      
    unless uid == '' or provider == ''    
      unless user_signed_in?
          
        auth = Service.find_by_provider_and_uid(provider, uid)
          
        if auth    
          flash[:notice] = "Signed in successfully via " + provider.capitalize + "."
          sign_in_and_redirect(:user, auth.user)            
        else            
          unless email == ''    
            existinguser = User.find_by_email(email)
              
            if existinguser                
              existinguser.services.create(:provider => provider, :uid => uid)
              
              flash[:notice] = "Sign in via " + provider.capitalize + " has been added to your account " + existinguser.email + ". Signed in successfully"
              sign_in_and_redirect(:user, existinguser)               
            else                
              user = User.new :email => email, :password => SecureRandom.hex(10), :username => username
              user.services.build(:provider => provider, :uid => uid)
                
              user.skip_confirmation!
              user.save!
              user.confirm!
                
              flash[:notice] = "Your account on Fortumo successfully created via " + provider.capitalize + "."
              sign_in_and_redirect(:user, user)                
            end              
          else              
            flash[:alert] = provider.capitalize + " can not be used to sign up on Fortumo as no valid email address has been provided."    
            redirect_to new_user_session_path              
          end            
        end          
      else
        #The user is currently signed in          
        auth = Service.find_by_provider_and_uid(provider, uid)          
        unless auth            
          current_user.services.create(:provider => provider, :uid => uid)
          
          flash[:notice] = "Sign in via " + provider.capitalize + " has been added to your account."
          redirect_to services_path            
        else            
          flash[:notice] = provider.capitalize + " is already linked to your account."
          redirect_to '/settings'           
        end          
      end
    else        
      flash[:alert] = provider.capitalize + " returned invalid data for the user id."
      redirect_to new_user_session_path        
    end 
  end
  
  def failure
    render :text => params.inspect
  end
end
