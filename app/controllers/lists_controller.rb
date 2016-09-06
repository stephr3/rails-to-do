class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to lists_path
    else
      flash[:alert] = "List not added"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "You have successfully updated your list!"
      redirect_to lists_path
    else
      flash[:alert] = "Your list has not been updated."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:alert] = "You have destroyed #{@list.name}."
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
