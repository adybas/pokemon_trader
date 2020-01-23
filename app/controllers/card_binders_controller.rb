class CardBindersController < ApplicationController

    before_action :login_check, only: [:edit, :update]
    before_action :find_cardbinder, only: [:edit, :update, :show]

    def edit 

    
    end 

    def update 

        @card_binder.update(card_binder_params)
        redirect_to trainers_home_path 
    end 


    def show 

    end 


    private 

    def find_cardbinder
        @card_binder = CardBinder.find(params[:id])
    end 

    def card_binder_params 
        params.require(:card_binder).permit(:for_trade)
    end 
end
