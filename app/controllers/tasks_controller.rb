class TasksController < ApplicationController

  def index
      list = List.find(params[:list_id])
      @incomplete_tasks = list.tasks.where(completed: false)
  end

  def show
    list = List.find(params[:list_id])
    @complete_tasks = list.tasks.where(completed: true)
  end

  def new
    @task = Task.new
    @tags = Tag.all
  end

  def create
    list = List.find(params[:list_id])
    @task = list.tasks.new(task_params)
    if @task.save
      tags = params[:task][:tag_ids].reject(&:empty?)
      tags.each do |id|
        @task.tags << Tag.find(id)
      end
        flash[:notice] = "Task successfully created"
        redirect_to list_tasks_path
    else
        render :new
    end
  end

  def edit
    list = List.find(params[:list_id])
    @task = list.tasks.find(params[:id])
    @tags = Tag.all
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
                                 :due_date,
                                 :tag_ids
                                 )
  end

end
