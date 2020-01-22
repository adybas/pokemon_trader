class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.string :trade_status
      t.integer :sender_id
      t.integer :receiver_id 
      t.timestamps
    end
  end
end
