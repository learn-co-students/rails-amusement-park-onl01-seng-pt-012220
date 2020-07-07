class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides
  
  def mood
    unless admin
      happiness > nausea ? "happy" : "sad"
    end
  end

  def admin?
    unless admin == true
      admin == false
    end
  end


  end