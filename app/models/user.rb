class User < ActiveRecord::Base
  
  acts_as_authentic
  
  def to_s
    username
  end
  
end
