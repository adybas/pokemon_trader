require 'pry'
class Trade < ApplicationRecord
    belongs_to :sender, class_name: "Trainer"
    belongs_to :receiver, class_name: "Trainer"
    
    has_many :offers
    has_many :card_binders, through: :offers
    has_many :offer_cards, class_name: "CardBinder", through: :offers
    has_many :base_cards, class_name: "CardBinder", through: :offers

    # def test
    #     return self.offer_card_ids ||= nil
    # end

    # def test=(offer_ids)
    #     self.offer_card_ids = offer_ids
    # end

    # def self.pending
    #     Trade.find_by(trade_status: "pending")
    # end
end
