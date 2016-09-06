class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "You have created your task."
      redirect_to list_path(@task.list)
    else
      flash[:alert] = "Your task has not been created."
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @list = @task.list
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "You have edited your task."
      redirect_to list_path(@task.list)
    else
      flash[:alert] = "Your task has not been edited."
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "You have destroyed your task."
    redirect_to list_path(@task.list)
  end

  private
    def task_params
      params.require(:task).permit(:description, :done)
    end
end
