class TasksController < ApplicationController
  def new
    @task = Task.new
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
  end

  def create
    @task = Task.new(task_params)
    status = params[:status]
    user_id = params[:user_id]
    if status && user_id
      @task.status = status
      @task.user_id = user_id
    end
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
    params.require(:task).permit(:name, :user, :amount, :group_id, :status)
  end
end
