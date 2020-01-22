class AddSenderToTrade < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :sender_id, :integer
  end
end
