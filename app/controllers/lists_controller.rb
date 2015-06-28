class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      flash[:notice] = "List successfully created"
      redirect_to lists_path
    else
      flash[:notice] = "Invalid entry"
      render :new
    end
  end

  def index
    @unarchived_lists = current_user.lists.where(archived: false)
  end

  def archived_index
    @archived_lists = current_user.lists.where(archived: true)
  end

  def show
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      flash[:notice] = "Invalid entry"
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end

end
