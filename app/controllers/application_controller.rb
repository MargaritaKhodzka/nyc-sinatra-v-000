class ApplicationController < Sinatra::Base

  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"/application/root"
  end

end
