class TasksController < ApplicationController
  def new
    @task = params[:group_id] ? Task.new(group_id: params[:group_id]) : Task.new
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
  end

  def create
    @task = Task.new(task_params)
    status = params[:status]
    user_id = params[:user_id]
    @task.status = status if status && user_id
    @task.user_id = user_id
    redirect_to tasks_path if @task.save
  end

  def index
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    @all_tasks = Task.most_recent
    @past_tasks = past_tasks(@all_tasks)
    @tasks = @user.see_my_tasks(@past_tasks)
  end

  def externals
    @all_tasks = Task.most_recent
    @external_tasks = current_user.external_tasks(@all_tasks)
  end

  def future
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    @all_tasks = Task.most_recent
    @future_tasks = future_tasks(@all_tasks)
    @tasks = @user.see_my_tasks(@future_tasks)
  end

  def done
    @user = current_user
    @task = Task.find(params[:task_id])
  end

  def done_post
    @task = Task.find(params[:task_id])
    @task.update(task_params)
    @task.status = true
    redirect_to tasks_path if @task.save
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :amount, :group_id, :status)
  end

  def past_tasks(tasks)
    tasks.select { |task| task.status == true }
  end

  def future_tasks(tasks)
    tasks.select { |task| task.status == false }
  end
end
