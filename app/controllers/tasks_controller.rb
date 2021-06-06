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
        find_task
        erb :'tasks/show'
    end

    private
    def find_task
        @task = Task.find_by(id:params[:id])
    end

end