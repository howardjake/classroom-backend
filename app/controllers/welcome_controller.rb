class WelcomeController < ApplicationController
    def index
        render json: { status: 200, message: "Gradebook API" }
    end 
end
