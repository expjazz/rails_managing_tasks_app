class GroupsController < ApplicationController
  require 'will_paginate/array'
  def new
    @font_list = Group.font_awesome_list
    @group = params[:project_id] ? Group.new(project_id: params[:project_id]) : Group.new
  end

  def index
    @groups = Group.alphabetical
  end

  def show
    @group = Group.find(params[:id])
    @tasks = current_user.see_my_tasks(@group.tasks.most_recent)
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
      flash.now[:notice] = 'Your group was created successfully'
    else
      @font_list = Group.font_awesome_list
      flash.now[:alert] = group_errors(@group)
      render 'groups/new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:icon, :name, :project_id)
  end

  def group_errors(group)
    if group.errors.full_messages.size > 1
      a = "The following errors prevented you from saving the group: \n"
      group.errors.full_messages.each do |e|
        a += " - #{e} \n"
      end
      a
    else
      "The following errors prevented you from saving the group: #{task.errors.full_messages[0]}"
    end
  end
end
