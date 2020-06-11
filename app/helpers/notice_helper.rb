module NoticeHelper
  def message_chat(user)
    Notice.find_by(sender: user)
  end
end
