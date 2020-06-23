class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if !happiness.nil?
      if happiness > nausea
        "happy"
      else
        "sad"
      end
   end
 end

end
