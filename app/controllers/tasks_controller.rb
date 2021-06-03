class TasksController < ApplicationController

    get '/tasks' do
        @tasks = Task.all 
        erb :'tasks/index'
    end

    get '/tasks/new' do
        @task = Task.new
        erb :'tasks/new'
    end

    get 'tasks/:id' do
        @task = Task.find(params[:id])
        erb :'tasks/show'
    end

end