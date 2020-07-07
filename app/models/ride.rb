class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
    valid = user.tickets >= attraction.tickets && user.height >= attraction.min_height
    too_short = user.height < attraction.min_height
    no_tickets = user.tickets < attraction.tickets
        if valid
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
            "Thanks for riding the #{self.attraction.name}!"
        elsif too_short && no_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif too_short
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif no_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
        end
    end


end


      