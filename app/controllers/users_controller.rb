class UsersController < ApplicationController
    get '/signup' do 
        erb :"users/signup"
    end 
    
    post '/signup' do 
        user = User.new(params)
        if user.username.blank? || user.password.blank? || User.find_by_username(params[:username])
            redirect '/signup'
        else 
            user.save
            session[:user_id] = user.id 
            redirect '/tasks'
        end 
    end 
    
    get '/login' do
        erb :"users/login"
    end 
    
    

    post '/login' do
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/tasks'
        else 
            
            flash[:error] = "Invalid login"
            redirect '/login'
        end 
    end 
    
    
    get '/logout' do
        session.clear
        redirect '/login'
    end 

    
end 