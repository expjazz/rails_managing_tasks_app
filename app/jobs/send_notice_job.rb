class SendNoticeJob < ApplicationJob
  queue_as :default

  def perform(notice)
    html = ApplicationController.render(partial: 'notice/sender', locals:
      { notice: notice.body })

    ActionCable.server.broadcast "chatroom_channel_#{notice.chatroom_id}",
                                 message: 'Hello',
                                 html: html,
                                 notice: notice,
                                 user: notice.sender,
                                 recipient: notice.recipient
  end
end
