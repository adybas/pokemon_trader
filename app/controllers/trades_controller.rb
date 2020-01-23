class TradesController < ApplicationController
    #before_action :login_check, only: [:create]

    def new
        @trade = Trade.new
    end

    def create
        receiver_id = CardBinder.find(params[:card_binder_id]).id
        byebug
        sender_id = @trainer.id
        trade_status = "pending"
        @trade = Trade.create(receiver_id: receiver_id, sender_id: sender_id, trade_status: trade_status)
        @trade.update(trade_params)
        redirect_to '/'
    end

    private

    def trade_params
        params.require("trade").permit!
    end 
end



