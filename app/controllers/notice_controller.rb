class NoticeController < ApplicationController
  def create
    notice = current_user.alert_sent.build(notice_params)
    if notice.save
      ActionCable.server.broadcast 'notice_channel',
                                   foo: notice.body
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:recipient_id, :body)
  end
end
