class ChatsController < ApplicationController
  def create
    @chatroom = Chatroom.new
    @recipient_id = chat_room_params
    if @chatroom.save
      respond_to do |format|
        format.js { render partial: 'notice/alerts', locals: { test: @recipient_id } }
      end
    else
      flash[:alert] = 'You chat session was not created'
    end
  end

  private

  def chat_room_params
    params.require(:id)
  end
end
