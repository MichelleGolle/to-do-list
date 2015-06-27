class TasksController < ApplicationController

  def index
    list = List.find(params[:list_id])
    @tasks = list.tasks
  end

  def new
    @task = Task.new
  end

  def create
    list = List.find(params[:list_id])
    @task = list.tasks.new(task_params)

    if @task.save
        flash[:notice] = "Task successfully created"
        redirect_to list_tasks_path
    else
        render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :description, :due_date)
  end

end
