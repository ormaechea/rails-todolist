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
    puts "HEYYYYY UPDATE *************"
    p params
    @task = Task.find(params[:id])
  end

  def create
    puts "*************"
    p params
    @task = Task.create(task_params)
    @task.save
    render :json => @task
  end

  def update
    puts "HEYYYYY UPDATE *************"
    p params
    p task_params
    @task = Task.find(params[:id])
    @task.update(task_params)
    respond_to do |x|
      x.json { render json: @task}
      x.html # index.html.erb
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
