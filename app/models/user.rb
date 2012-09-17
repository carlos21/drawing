class User < ActiveRecord::Base
  attr_accessible :nickname

  def self.get_or_set_user(session)
    
    if session[:user_id].nil?
      user = self.new
      if user.save
        session[:user_id] = user.id
      end
    else
      user = self.find(session[:user_id])
    end

    user
  end
end
