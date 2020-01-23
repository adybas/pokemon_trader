class CardBindersController < ApplicationController




    private 

    def card_binder_params 
        params.require(:trainer).permit(card_binder_ids:[] )
    end 
end
