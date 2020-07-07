class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    #validates :password_digest, presence: true
    validate :set_admin
    has_secure_password

    def set_admin
        if self.admin == nil
            self.admin = false 
        else
        end
    end

    def mood 
        if self.nausea && self.happiness
            if self.nausea > self.happiness
             "sad"
            elsif self.nausea < self.happiness
             "happy"
            else
            end
        end
    end




end

# :name => "Mindy",
# :password => "password",
# :nausea => 5,
# :happiness => 3,
# :tickets => 4,
# :height => 34