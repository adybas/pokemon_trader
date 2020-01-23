require 'byebug'
class Trainer < ApplicationRecord
    has_secure_password
    has_many :card_binders 
    has_many :cards, through: :card_binders

    has_many :trades
    has_many :senders, through: :trades
    has_many :receivers, through: :trades

    
    def open_a_pack  
        #used to get a random array of 6 cards for the trainer 
        pack_array = []
        6.times do     
            pack_array << Card.all.sample 
        end 
        return pack_array 
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

    # returns cards not marked for trade 
    def cards_not_for_trade
        self.card_binders.select do |card|
            card.for_trade == false || card.for_trade == nil 
        end 
    end 
    
    private 

end

