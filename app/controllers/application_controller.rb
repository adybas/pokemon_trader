class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :current_trainer

    helper_method :current_trainer 

    def current_trainer

        #either has a new trainer object to use temporarily or carries login info
        @trainer = (Trainer.find_by(id: session[:user_id]) || Trainer.new )
    end 

    def logged_in?
        current_trainer.id != nil 
    end 

    def login_check
        redirect_to(controller:'sessions', action:'new') unless logged_in?
    end 

end
