require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    

    def logged_in?
      !!session[:user_id]
    end

    def current_user # return logged in user 
      @current_user ||= User.find_by_id(session[:user_id]) #memoization
     end 
    
  end

end
