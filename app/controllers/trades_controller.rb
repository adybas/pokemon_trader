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

    def edit 
        @trade = Trade.find_by(params[:id])
    end 

    def update
    end 

    def accept_trade 

    end 

    def updated_trade

        @trade = Trade.find(params["trade"].to_i)
        @offer = Offer.find(params["offer"].to_i)
        @trade.update(trade_status: "Accepted")
        base_card_owner = @offer.base_card.trainer_id.to_i 
        offer_card_owner = @offer.offer_card.trainer_id.to_i 
        @offer.base_card.update(trainer_id: offer_card_owner, for_trade: false)
        @offer.offer_card.update(trainer_id: base_card_owner, for_trade: false)

        flash.notice = "You've accepted their trade!"
        redirect_to root_path #maybe trainers_home_path 
    end 

    def cancelled_trade

        @trade = Trade.find(params["trade"].to_i)
        @offer = Offer.find(params["offer"].to_i)
        @trade.update(trade_status: "Cancelled")
        @offer.destroy 
        flash.notice = "You declined their trade!"
        redirect_to root_path #maybe trainers_home_path
    end 

    private

    def trade_params
        params.require("trade").permit!
    end 
end



