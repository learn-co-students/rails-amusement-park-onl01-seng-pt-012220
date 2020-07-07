class AttractionsController < ApplicationController

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        if attraction.save
            attraction.save
            redirect_to attraction_path(attraction)
        else
            redirect_to attractions_path
        end
    end

    def index  
        attractions = Attraction.all 
        if attractions
            @attractions = attractions
        else
            @attractions = []
        end

    end

    def show
        @user = current_user
        @attr = Attraction.find_by(:id => params[:id])
    end

    def edit
        if current_user.admin
         @attraction = Attraction.find_by(params[:id])
        else
            @attraction = Attraction.find_by(:id => params[:id])
            redirect_to attraction_path(@attraction)
        end
    end
    
    def update
        @attraction = Attraction.find_by(:id => params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def ride 
        flash[:alert] = Ride.create(ride_params).take_ride
        redirect_to user_path(current_user)
    end


    private
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
      end

    def ride_params
        params.permit(:user_id, :attraction_id)
    end
end

