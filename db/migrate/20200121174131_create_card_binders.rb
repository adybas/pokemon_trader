class CreateCardBinders < ActiveRecord::Migration[6.0]
  def change
    create_table :card_binders do |t|

      t.integer :trainer_id 
      t.integer :card_id 
      t.boolean :for_trade 
      

      t.timestamps
    end
  end
end
