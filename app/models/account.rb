class Account < ActiveRecord::Base
  
  has_many :users
  authenticates_many :user_sessions
  
  has_many :photos
  
  # We require all of these to be filled out
  validates_presence_of :name, :subdomain, :email, :phone
  
  # We can't have subdomains that are the same
  validates_uniqueness_of :subdomain, :name, :email
  
  def default_url
    "#{subdomain}.photo.local"
  end
  
  def to_s
    name
  end
  
end
