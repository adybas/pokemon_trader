class SessionsController < ApplicationController

    def new
    end 

    def create 
        trainer = Trainer.find_by(name: params[:trainer][:name])
        trainer = trainer.try(:authenticate, params[:trainer][:password])

        #return redirect_to(controller:'sessions', action:'new') unless trainer 
        if trainer 
        session[:user_id] = trainer.id 
        @trainer = trainer 
        redirect_to controller:'welcome', action:'home'
        else 
            flash[:notice] = "Incorrect username or password"
            return redirect_to(controller:'sessions', action:'new') 
        end 
    end 

    def destroy 
        #session.delete :user_id 
        reset_session 
        redirect_to '/'
    end 

    private 

end
