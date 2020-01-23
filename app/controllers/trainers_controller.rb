class TrainersController < ApplicationController

    before_action :login_check, except: [:new, :create]
    before_action :find_trainer, only: [:show]

    def new  
        @trainer = Trainer.new   
    end 

    def create 
        @trainer = Trainer.create(trainer_params)
        return render :new unless @trainer.save 
     
        if @trainer.save 
        session[:user_id] = @trainer.id 
        redirect_to controller: 'welcome', action: 'home'
        else 
            render :new 
        end 
    end 

    def show 
        
    end 

    def home 
        @all_cards_album = @trainer.cards
        @all_card_up_for_trade = @trainer.cards_up_for_trade 
    end 

    def pack_open 
        @pack = @trainer.pack_card_return_to_object(session[:new_pack])
    end 

    def pack_contents
        session[:new_pack] = nil 
        new_pack = @trainer.open_a_pack
        @trainer.cards << new_pack 
        session[:new_pack] = @trainer.pack_card_id_only(new_pack)
        redirect_to trainers_pack_open_path(@trainer)
    end 

    def mark_trades
        @cards_in_binder = @trainer.card_binders 
    end 

    def mark_trades_for_trainer 

        card_for_trade = CardBinder.find(params[:cardbinder].to_i)
        if params["for_trade"] == "1"
        card_for_trade.update(for_trade: true)
        card_for_trade.for_trade = true
        card_for_trade.save 
        else 
        card_for_trade.update(for_trade: false)
        end 

        redirect_to trainers_home_path
    end 



    private 

    def find_trainer 
        @trainer = Trainer.find(params[:id])
    end 

    def trainer_params
        params.require(:trainer).permit(:name, :password, :password_confirmation, :for_trade, :cardbinder)
    end 
end
