module ServicesHelper
  def omniauth_factory(omniauth)
    if omniauth
      omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''
      
      if provider == 'facebook'
        omniauth['extra']['raw_info']['id'] ?  uid =  omniauth['extra']['raw_info']['id'] : uid = ''
        omniauth['extra']['raw_info']['name'] ? username = omniauth['extra']['raw_info']['name'] : username = ''
        omniauth['extra']['raw_info']['email'] ? email = omniauth['extra']['raw_info']['email'] : email = ''    
      end
      
      [provider, uid, email, username]  
    end    
  end
end
