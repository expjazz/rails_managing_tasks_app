class GroupsController < ApplicationController
  def new; end

  def index
    @groups = Group.alphabetical
  end

  def create; end
end
