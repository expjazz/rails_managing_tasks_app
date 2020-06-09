class NoticeController < ApplicationController
  def create
    @notice = current_user.alert_sent.build(notice_params)
    @notice.chatroom_id = params[:chatroom_id]
    if @notice.save

      html = render(partial: 'notice/sender', locals:
        { notice: @notice.body })

      ActionCable.server.broadcast "chatroom_channel_#{@notice.chatroom_id}",
                                   message: 'Hello',
                                   html: html,
                                   notice: @notice,
                                   user: @notice.sender,
                                   recipient: @notice.recipient,
                                   chatroom: @notice.chatroom_id
      # ActionCable.server.broadcast 'notice_channel',
      #                              message: notice.body,
      #                              user: notice.sender.name,
      #                              recipient: notice.recipient.name

    end
  end

  private

  def notice_params
    params.require(:notice).permit(:recipient_id, :body)
  end
end
