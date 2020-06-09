class ChatsController < ApplicationController
  def create
    @chatroom = Chatroom.new
    if @chatroom.save
      respond_to do |format|
        format.js { render partial: 'notice/alerts' }
      end
    end
  end
end
