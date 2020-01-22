class Trainer < ApplicationRecord
    has_secure_password
    has_many :card_binders 
    has_many :cards, through: :card_binders

    has_many :trades
    has_many :senders, through: :trades
    has_many :receivers, through: :trades
end
