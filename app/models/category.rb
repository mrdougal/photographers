class Category < ActiveRecord::Base
  
  validates_presence_of :name, :message => "can't be left blank" 
  validates_uniqueness_of :name
  
  
  has_many :photo_sets #, :class_name => 'PhotoSet'
  
  # Only show the uniqueness message, if the name has already been filled in
  # validates_uniqueness_of :name, :message => "has already been taken",  :if => lambda { |category| !category.name.blank?  }

  def to_s
    name
  end
  
  alias :sets :photo_sets 
  
  def can_delete?
    false
  end
  
end