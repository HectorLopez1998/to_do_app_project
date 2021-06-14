class TasksController < ApplicationController
    
  get '/tasks' do
      @tasks = Task.all 
      @user = current_user
      erb :'tasks/index'
  end

  get '/tasks/new' do
    
    @user = current_user
      @task = Task.new
      erb :'tasks/new'
  end

  get '/tasks/:id' do
   
    @task = Task.find_by(id:params[:id])
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
      redirect_if_not_authorized
      # not_authorized 
       erb :"/tasks/edit"
    end

    patch '/tasks/:id' do 
      @task = Task.find_by(id:params[:id])
      redirect_if_not_authorized
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

  def redirect_if_not_authorized
    if @task.user != current_user
        flash[:error] = "You cant make this edit, you don't own this"
        redirect '/tasks'
    end 

end 

  

end