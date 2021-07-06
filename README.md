To-Do web app

Welcome to my simplistic version of a To-Do web app.

ABOUT:
The main goal of this web app is to allow the user to create lists and add tasks to those lists.

Models
User, Task

has_many :tasks
has_secure_password

Task
belongs_to :user

Controller
ApplicationController
UsersController
TasksController

Installation
$ git clone 👾
$ bundle install
$ rake db:migrate 
$ shotgun

Open Chrome browser, and redirect to 'http://localhost:9292' to start the app.



