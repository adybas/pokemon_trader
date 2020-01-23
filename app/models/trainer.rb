require 'byebug'
class Trainer < ApplicationRecord
    has_secure_password
    has_many :card_binders 
    has_many :cards, through: :card_binders

    has_many :trades
    has_many :senders, through: :trades
    has_many :receivers, through: :trades

    
    def open_a_pack  
        #used to get a random array of cards for the trainer 
        Card.all.sample(6)
    end 

    def pack_card_id_only(pack_array)
        #only takes the card ids instead of the whole card above. Used for session/cookies
        pack_array.map {|card| card.id}
    end 

    def pack_card_return_to_object(pack_array)
        #takes above and returns it to an array of card objects
        pack_array.map do |card|
             Card.all.find(card)
        end 
    end 

    # returns cards marked for trade
    def cards_up_for_trade
        self.card_binders.select do |card_binder|
            card_binder.for_trade == true
        end
    end

    # #returns trades for this trainer
    # def trades_to_trainer(arg)
    #     arg.select {|trade| trade.receiver_id == self.id}
    # end

    # #display sending trainers
    # def find_sending_trainer_id
    #     trade = self.trades_to_trainer(Trade.pending)
    #     Trainer.find_by(id: trade.sender_id)
    # end

    def trades_to_trainer
        Trade.find_by(receiver_id: self.id)
    end

    def find_sending_trainer_info
        trade = self.trades_to_trainer
        trainer_object = Trainer.find_by(id: trade.sender_id) 
        byebug
    end

    #display card offered
    def display_card
        trainer_offering_card = find_sending_trainer_id
    end 

    #returns cards offered and name
    def cards_offered_to_trainer
        @sender_name = find_sending_trainer_info.name
        @offer_card = display_card
    end

    private 

end

