class Category < ActiveRecord::Base
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  acts_as_url :name, :url_attribute => :permalink, :sync_url => true
  
  
  def to_s
    name
  end
  
  def to_param
    permalink
  end
  
end
