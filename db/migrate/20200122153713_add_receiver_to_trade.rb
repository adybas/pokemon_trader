class AddReceiverToTrade < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :receiver_id, :integer
  end
end
