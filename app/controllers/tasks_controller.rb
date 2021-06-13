class TasksController < ApplicationController
    
    get '/tasks' do
        @tasks = Task.all 
        @user = current_user
        erb :'tasks/index'
    end

    get '/tasks/new' do
      redirect_if_not_logged_in
      @user = current_user
        @task = Task.new
        erb :'tasks/new'
    end

    get '/tasks/:id' do
        find_task
        @tasks = Task.all
        @user = current_user
        erb :'tasks/show'
    end
    
    post '/tasks' do 
        @task = Task.new(params)
        @task.user_id = session[:user_id]
        @task.save
        redirect "/tasks/#{@task.id}"
      end

      get '/tasks/:id/edit' do 
        @task = Task.find_by(id:params[:id])
        # not_authorized 
         erb :"/tasks/edit"
      end

      patch '/tasks/:id' do 
        @task = Task.find_by(id:params[:id])
        @task.update(title: params[:title], description: params[:description])
        redirect "/tasks/#{@task.id}"
      end

      delete '/tasks/:id' do 
        @task = Task.find_by(id:params[:id])
        @task.destroy
        redirect '/tasks'
      end

    private
    def find_task
        @task = Task.find_by(id:params[:id])
    end

    

end