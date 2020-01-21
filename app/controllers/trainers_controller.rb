class TrainersController < ApplicationController

    def new 
    end 

    def create 
        @trainer = Trainer.create(trainer_params)
        return redirect_to controller: 'trainers', action: 'new' unless @trainer.save 
     
        session[:user_id] = @trainer.id 
        redirect_to controller: 'welcome', action: 'home'
    end 

    private 

    def find_trainer 
        @trainer = Trainer.find(params[:id])
    end 

    def trainer_params
        params.require(:trainer).permit(:name, :password, :password_confirmation)
    end 
end
