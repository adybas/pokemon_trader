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

    def find_trainer_in_binder
        Trainer.find_by(id: self.trainer_id)
    end 

    def display_trainer_name_from_binder
        self.find_trainer_in_binder.name 
    end 


    def self.find_all_trades

        CardBinder.all.select{|card| card.for_trade == true }
    end 
end
