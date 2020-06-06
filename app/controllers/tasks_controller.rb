class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.group_id = 1
    @task.user = current_user
    redirect_to tasks_path if @task.save
  end

  def index
    @tasks = Task.most_recent
  end

  private

  def task_params
    params.require(:task).permit(:name, :user, :amount, :group_id)
  end
end
