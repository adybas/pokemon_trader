require 'byebug'
class Trainer < ApplicationRecord
    has_secure_password
    has_many :card_binders 
    has_many :cards, through: :card_binders

    has_many :trades
    has_many :senders, through: :trades
    has_many :receivers, through: :trades

    
    def open_a_pack  
<<<<<<< HEAD
        #used to get a random array of cards for the trainer 
        Card.all.sample(6)
=======
        #used to get a random array of 6 cards for the trainer 
        pack_array = []
        6.times do     
            pack_array << Card.all.sample 
        end 
        return pack_array 
>>>>>>> 4f81c40e59e3be3849957840a7b102b0fd0fadd7
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
<<<<<<< HEAD
=======

    # returns cards not marked for trade 
    def cards_not_for_trade
        self.card_binders.select do |card|
            card.for_trade == false || card.for_trade == nil 
        end 
    end 
    
    private 
>>>>>>> 4f81c40e59e3be3849957840a7b102b0fd0fadd7

    #returns trades for this trainer
    def received_trades(arg)
        arg.select {|trade| trade.receiver_id == self.id}
    end

    
end

# #display sending trainers
# def find_sending_trainer_id
#     trade = self.trades_to_trainer(Trade.pending) #give me back an array
#     #byebug
#     #Trainer.where(id: trade.sender_id)
# end

# def trades_to_trainer
#     Trade.find_by(receiver_id: self.id)
# end

# def find_sending_trainer_info
#     trade = self.trades_to_trainer
#     @trainer_object = Trainer.find_by(id: trade.sender_id)
#     @offer_object = Offer.find_by(trade_id: trade.id)
# end

# def find_offer
#     trade = self.trades_to_trainer
#     Offer.find_by(trade_id: trade.id)
# end


# received_trades(Trade.pending).each do |trade|
#     Trainer.find_by(id: trade.sender_id)
#     byebug
# end