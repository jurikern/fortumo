Fortumo::Application.routes.draw do
  root :to => "main#index"
  
  devise_for :users, :controllers => { 
      :registrations => "users/registrations", 
      :confirmations => "users/confirmations",
      :passwords => "users/passwords", 
      :sessions => "users/sessions" 
    }, 
      :path => "", 
      :path_names => { 
      :sign_in => "sign-in", 
      :sign_out => "sign-out", 
      :sign_up => "",
      :registration => "sign-up"
    }
    
  match '/auth/:service/callback' => 'services#create'
  match '/auth/failure'           => 'services#failure'  
  
  match '/me', :to => "profiles#show"
  match '/registered-users', :to => "profiles#index"
  match '/settings', :to => "profiles#edit"
  match '/upload-settings', :to => "profiles#update", :via => :put
  
  resource :images
  match '/view-images',  :to => "images#index"
  match '/delete-image', :to => "images#destroy", :via => :delete
end
