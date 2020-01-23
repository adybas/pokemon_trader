class CardBinder < ApplicationRecord

    belongs_to :trainer 
    belongs_to :card 
    
    has_many :offers
    has_many :trades, through: :offers

    attr_reader :display_card_name_from_binder

    def find_card_in_binder
        Card.find_by(id: self.card_id)
    end

    def display_card_name_from_binder
        
        self.find_card_in_binder.name 
    end 
end
