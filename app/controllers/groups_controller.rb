class GroupsController < ApplicationController
  require 'will_paginate/array'
  def new
    @font_list = Group.font_awesome_list
    @group = Group.new
  end

  def index
    @groups = Group.alphabetical
  end

  def create; end
end
