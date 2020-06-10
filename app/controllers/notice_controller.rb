class NoticeController < ApplicationController
  skip_forgery_protection
  def create
    @notice = current_user.alert_sent.build(notice_params)
    @notice.chatroom_id = 1
    if @notice.save

      ActionCable.server.broadcast "chatroom_channel_#{@notice.chatroom_id}",
                                   message: 'Hello',
                                   sender: @notice.sender,
                                   recipient: @notice.recipient,
                                   notice: @notice,
                                   date: @notice.created_at.to_date
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:recipient_id, :body)
  end
end
