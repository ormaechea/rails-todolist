class TasksController < ApplicationController

  def index
    @tasks = Task.all
    respond_to do |x|
      x.json { render json: @tasks}
      x.html # index.html.erb
    end
  end



  def show
    @task = Task.find(params[:id])
    respond_to do |x|
      x.json { render json: @task}
      x.html # index.html.erb
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
   if params[:task]
      params[:task].each do |key, value|
        params[key] = value
      end
    end
    @task = Task.create(task_params)
    @task.save
     respond_to do |x|
      x.json { render json: @task}
      x.html { redirect_to tasks_path}
    end
  end

  def update
#here we re-organize the params if they are sent from a form (web) so that it works regardless where the request is coming
    if params[:task]
      params[:task].each do |key, value|
        params[key] = value
      end
    end
    @task = Task.find(params[:id])
    @task.update(task_params)
    respond_to do |x|
      x.json { render json: @task}
      x.html { redirect_to tasks_path}
    end


  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path

  end

  private
    def task_params
      #params.require(:task).permit(:name, :completed)
      #NEED TO FIX THIS SECURITY SHIT. Now I Know why people talk about rails freaking security.
      params.permit(:name, :completed, :id)
    end



end
