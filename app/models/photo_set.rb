class PhotoSet < ActiveRecord::Base
  
  validates_presence_of :name, :message => "can't be left blank" 
  validates_uniqueness_of :name, :scope => :category_id
  
  belongs_to :category
  validates_presence_of :category
  
  has_many :photos
  
  
  def to_s
    name
  end
  
  def can_delete?
    photos.empty?
  end
  
end
