class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :trade_id
      t.integer :base_card_id
      t.integer :offer_card_id

      t.timestamps
    end
  end
end
