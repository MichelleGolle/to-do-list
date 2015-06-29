class TasksController < ApplicationController

  def index
    if search
      matching_tasks
    else
      list = List.find(params[:list_id])
      @incomplete_tasks = list.tasks.where(completed: false)
    end
  end

  def show
    if search
      matching_completed_tasks
    else
    list = List.find(params[:list_id])
    @complete_tasks = list.tasks.where(completed: true)
  end
  end

  def new
    @task = Task.new
    @tags = Tag.all
  end

  def create
    list = List.find(params[:list_id])
    @task = list.tasks.new(task_params)
    if @task.save
      assign_tags
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
      assign_tags
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

  def search
    params[:search] && params[:search] != ''
  end

  def matching_tasks
    list = List.find(params[:list_id])
    @incomplete_tasks = list.tasks.where(completed: false).map do |task|
      if task.tags.where(name: params[:search]).length > 0
        task
      end
    end.compact
  end

  def matching_completed_tasks
    list = List.find(params[:list_id])
    @complete_tasks = list.tasks.where(completed: true).map do |task|
      if task.tags.where(name: params[:search]).length > 0
        task
      end
    end.compact
  end


  def assign_tags
    tags = params[:task][:tag_ids].reject(&:empty?)
    tags.each do |id|
      @task.tags << Tag.find(id)
    end
  end
end
