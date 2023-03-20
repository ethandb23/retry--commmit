class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  def show
    @task = current_user.tasks.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed)
  end
end
