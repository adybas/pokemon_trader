class Trainer < ApplicationRecord

    has_secure_password
    has_many :card_binders 
    has_many :cards, through: :card_binders
end
