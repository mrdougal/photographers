class User < ActiveRecord::Base
  
  belongs_to :account
  validates_presence_of :account
  
  
  acts_as_authentic
  
  def to_s
    username
  end
  
end
