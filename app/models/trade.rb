class Trade < ApplicationRecord
    belongs_to :sender, class_name: "Trainer"
    belongs_to :receiver, class_name: "Trainer"
    
    has_many :offers
    has_many :offer_cards, class_name: "CardBinder", through: :offers
    has_many :base_cards, class_name: "CardBinder", through: :offers
end
