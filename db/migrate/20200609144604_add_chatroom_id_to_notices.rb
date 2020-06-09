class AddChatroomIdToNotices < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :chatroom_id, :integer
  end
end
