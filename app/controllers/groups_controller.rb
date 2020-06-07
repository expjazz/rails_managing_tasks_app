class GroupsController < ApplicationController
  require 'will_paginate/array'
  def new
    @font_list = Group.font_awesome_list
    @group = Group.new
  end

  def index
    @groups = Group.alphabetical
  end

  def show
    @group = Group.find(params[:id])
    @tasks = @group.tasks.most_recent
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    @group.save
  end

  private

  def group_params
    params.require(:group).permit(:icon, :name, :project_id)
  end
end
