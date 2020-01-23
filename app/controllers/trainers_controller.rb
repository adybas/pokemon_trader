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
        @pending_trades = @trainer.received_trades(Trade.pending)
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
    
    end 

    def mark_trades_for_trainer 

        @card_set = params[:card_binder_ids]
        # card_set = trainer_params 
        # card_set.each do |card_binder_id|

        #     card = CardBinder.find_by(card_binder_id)
        #     card.for_trade = true 
        #     card.save
        # end 
        #byebug 
        @card_set.each do |card_binder_id|
            
            card = CardBinder.find_by(card_binder_id)
            card.for_trade = true 
            card.save 
        end 

        redirect_to trainers_home_path
    end 



    private 

    def find_trainer 
        @trainer = Trainer.find(params[:id])
    end 

    def trainer_params
        params.require(:trainer).permit(:name, :password, :password_confirmation, card_binder_ids: [])
    end 
end
