class TasksController < ApplicationController

  def index
    list = List.find(params[:list_id])
    @incomplete_tasks = list.tasks.where(completed: false)
  end

  # def completed_index
  #   @list = List.find(params[:list_id])
  #   @completed_tasks = list.tasks.where(completed: true)
  # end

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

  def edit
    list = List.find(params[:list_id])
    @task = list.tasks.find(params[:id])
  end

  def update
    list = List.find(params[:list_id])
    @task = list.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to list_tasks_path
    else
      flash[:notice] = "Invalid entry"
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title,
                                 :completed,
                                 :description,
                                 :due_date
                                 )
  end

end
