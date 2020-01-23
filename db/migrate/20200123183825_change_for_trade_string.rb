class ChangeForTradeString < ActiveRecord::Migration[6.0]
  def change

    change_column :card_binders, :for_trade, :string 
  end
end
