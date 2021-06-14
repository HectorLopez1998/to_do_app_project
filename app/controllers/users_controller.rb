class UsersController < ApplicationController
    get '/signup' do # render signup form
        erb :"users/signup"
    end 
    
    post '/signup' do # process the signup form
        # receive data from the form inside of params hash
        # create a new author object with the data
        user = User.new(params)
        # validate our author object
        # if author.username != ""
        if user.username.blank? || user.password.blank? || User.find_by_username(params[:username])
            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id # logging user in
            redirect '/tasks'
        end 
    end 
    
    get '/login' do # render the login form
        erb :"users/login"
    end 
    
    

    post '/login' do # process the login form
        # gather data from the form => params
        # find my author object
        user = User.find_by_username(params[:username])
        # binding.pry
        # if author exists && password is correct
        if user && user.authenticate(params[:password])
            # login user
            session[:user_id] = user.id
            # redirect 
            redirect '/tasks'
        else 
            # flash[]
            flash[:error] = "Invalid login"
            # invalid login
            redirect '/login'
        end 
    end 
    
    
    get '/logout' do
        session.clear
        redirect '/login'
    end 

    # logout  'logout' delete => clears our session
end 