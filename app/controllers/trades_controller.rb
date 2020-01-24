class TradesController < ApplicationController
    before_action :login_check, only: [:create]

    def new
        @trade = Trade.new
    end

    def create
        receiver_id = CardBinder.find(params[:card_binder_id]).trainer_id
        sender_id = @trainer.id
        trade_status = "pending"
        @trade = Trade.create(receiver_id: receiver_id, sender_id: sender_id, trade_status: trade_status)
        # trade_params["base_card_id"] = (params[:card_binder_id])
        # @trade.update(trade_params)
    
        # offer.create(trade_id: @trade.id, trade_params )
        # offer.
        # Trainer.find(params[:sender_id])
        # offer_card = CardBinder.find()
        @offer = Offer.create(trade_id: @trade.id, "offer_card_id" => trade_params["offer_card_ids"], base_card_id: params[:card_binder_id])
        # byebug 
        redirect_to '/trainers/home'
    end

    def index 

    end 

    private

    def trade_params
        params.require("trade").permit!
    end 
end



