class CardBindersController < ApplicationController

    before_action :login_check, :find_cardbinder

    def edit 

    end 

    def update 

        @card_binder.update(card_binder_params)
        redirect_to trainers_home_path 
    end 


    private 

    def find_cardbinder
        @card_binder = CardBinder.find_by(params[:id])
    end 

    def card_binder_params 
        params.require(:card_binder).permit(:for_trade)
    end 
end
