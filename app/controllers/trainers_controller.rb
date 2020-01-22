class TrainersController < ApplicationController

    before_action :login_check 

    def new  
        @trainer = Trainer.new   
    end 

    def create 
        @trainer = Trainer.create(trainer_params)
        return redirect_to controller: 'trainers', action: 'new' unless @trainer.save 
     
        session[:user_id] = @trainer.id 
        redirect_to controller: 'welcome', action: 'home'
    end 

    def home 
        @all_cards_album = @trainer.cards 
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

    private 

    def find_trainer 
        @trainer = Trainer.find(params[:id])
    end 

    def trainer_params
        params.require(:trainer).permit(:name, :password, :password_confirmation)
    end 
end
