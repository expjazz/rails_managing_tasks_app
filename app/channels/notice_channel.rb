class NoticeChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'notice_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
