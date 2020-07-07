class Attraction < ApplicationRecord
    has_many :rides
    has_many :users, through: :rides

end

# :name => "Roller Coaster",
# :tickets => 5,
# :nausea_rating => 2,
# :happiness_rating => 4,
# :min_height => 32