class Offer < ApplicationRecord
    belongs_to :trade_id
    belongs_to :base_card, class_name: "CardBinder"
    belongs_to :offer_card, class_name: "CardBinder"
end