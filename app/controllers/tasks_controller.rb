class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end

  def index
    @date = params[:date]
    @tasks = Task.where(calendar_date: @date).order(:title)
  end
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def day_has_tasks?
    Task.where(calendar_date: params[:date]).exists?
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed, :calendar_date)
  end
end
