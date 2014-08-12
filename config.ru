require 'dashing'

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

use Rack::Auth::Basic, "Protected Area" do |username, password|
  username == ENV['ADMIN_USERNAME']  && password == ENV['ADMIN_PASSWORD'] 
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end



run Sinatra::Application
