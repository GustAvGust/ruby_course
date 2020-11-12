class TasksController < ApplicationController
  before_action :set_list, only: %i[index new edit]

  def index
    @tasks = @list.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params.merge(list_id: params[:list_id]))
    if @task.save
      redirect_to list_task_path(params[:list_id], @task)
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to list_task_path(params[:list_id], @task)
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to list_tasks_path(params[:list_id], @task)
  end

  private

  def task_params
    params.require(:task).permit(:header, :description)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
