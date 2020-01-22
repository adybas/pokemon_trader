class CardBinder < ApplicationRecord

    belongs_to :trainer 
    belongs_to :card 
    
    has_many :offers
    has_many :trades, thourgh: :offers
end
