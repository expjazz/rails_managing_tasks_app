class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    byebug
    @task = Task.new(task_params)
    byebug
    @task.user = current_user
    redirect_to tasks_path if @task.save
  end

  def index
    @all_tasks = Task.most_recent
    @tasks = current_user.see_my_tasks(@all_tasks)
    @font_list = Group.font_awesome_list
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
