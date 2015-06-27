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
    @lists = current_user.lists
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end

end
