class UsersController < ApplicationController
get '/signup' do
    if logged_in?
        redirect '/tasks'
    else 
        erb :'users/signup'
    end
end