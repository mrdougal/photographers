class Category < ActiveRecord::Base
  
  validates_presence_of :name, :message => "can't be left blank" 
  validates_uniqueness_of :name
  
  
  has_many :photos #_sets #, :class_name => 'PhotoSet'

  acts_as_url :name, :url_attribute => :permalink, :sync_url => true

  
  # Only show the uniqueness message, if the name has already been filled in
  # validates_uniqueness_of :name, :message => "has already been taken",  :if => lambda { |category| !category.name.blank?  }

  def to_s
    self.name
  end
  
  def to_param
    self.permalink
  end
  
  # alias :sets :photo_sets 
  
  def can_delete?
    self.photos.empty?
  end
  
end