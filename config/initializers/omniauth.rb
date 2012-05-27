Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '392829774096506', '5e0a65426ac123cce35c3acde0ba81fd', :scope => 'email,offline_access,read_stream' if Rails.env.production?
  provider :facebook, '315087038570235', 'aebe59dc53bc843a70615b98707cc49f', :scope => 'email,offline_access,read_stream' if Rails.env.development?  
end

if Rails.env.development?
  OmniAuth.config.full_host = 'http://localhost:3000'
end
