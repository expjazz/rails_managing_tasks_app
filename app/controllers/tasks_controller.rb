class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    redirect_to tasks_path if @task.save
  end

  def index
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    @all_tasks = Task.most_recent
    @tasks = @user.see_my_tasks(@all_tasks)
  end

  def externals
    @all_tasks = Task.most_recent
    @external_tasks = current_user.external_tasks(@all_tasks)
  end

  private

  def task_params
    params.require(:task).permit(:name, :user, :amount, :group_id)
  end
end
