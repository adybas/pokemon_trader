class TradesController < ApplicationController
    before_action :login_check, only: [:create]

    def new
        @trade = Trade.new
    end

    def create
        @trade = Trade.create(trade_params)
        redirect_to '/'
    end

    private

    def trade_params
        params.require(:trade).permit!
    end 
end



