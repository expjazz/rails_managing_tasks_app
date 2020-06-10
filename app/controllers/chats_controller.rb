class ChatsController < ApplicationController
  def create
    @chatroom = Chatroom.new
    @recipient_id = params.require(:id)
    if @chatroom.save

      respond_to do |format|
        format.js { render partial: 'notice/alerts', locals: { test: @recipient_id } }
      end
    end
  end
end
