class Card < ApplicationRecord

    has_many :card_binders
    has_many :trainers, through: :card_binders 
end
