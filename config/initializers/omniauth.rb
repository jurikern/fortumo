if Rails.env.development?
  OmniAuth.config.full_host = 'http://localhost:3000'
elsif Rails.env.production?
  #
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '315087038570235', 'aebe59dc53bc843a70615b98707cc49f', :scope => 'email,offline_access,read_stream'  
end