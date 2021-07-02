class TasksController < ApplicationController
    
  get '/tasks' do
    redirect_if_not_logged_in 
      @tasks = Task.all 
      @user = current_user
      erb :'tasks/index'
  end

  get '/tasks/new' do
    redirect_if_not_logged_in 
    @tasks = Task.all
      erb :'tasks/new'
  end

  get '/tasks/:id' do
    redirect_if_not_logged_in
    @task = Task.find_by(id:params[:id]) 
      erb :'tasks/show'
  end

  get '/tasks/:id/edit' do 
    redirect_if_not_logged_in
    @task = Task.find_by(id:params[:id])
    redirect_if_not_authorized
    # not_authorized 
     erb :"/tasks/edit"
  end
  
  post '/tasks' do 
    redirect_if_not_logged_in 
      @task = Task.new(params)
      @task.user_id = session[:user_id]
      @task.save
      redirect "/tasks/#{@task.id}"
    end


    patch '/tasks/:id' do 
      redirect_if_not_logged_in 
      @task = Task.find_by(id:params[:id])
      redirect_if_not_authorized
      @task.update(title: params[:title], description: params[:description])
      redirect "/tasks/#{@task.id}"
    end

    delete '/tasks/:id' do 
      redirect_if_not_logged_in
      @task = Task.find_by(id:params[:id])
      redirect_if_not_authorized
      @task.destroy
      redirect '/tasks'
    end

  private

  def redirect_if_not_authorized
    if @task.user != current_user
        flash[:error] = "You cant make this edit, you don't own this"
        redirect '/tasks'
    end 

end 
end