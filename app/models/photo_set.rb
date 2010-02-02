class PhotoSet < ActiveRecord::Base
  
  validates_presence_of :name
  
  # For permalinks on the photo
  acts_as_url :name, :url_attribute => :permalink, :sync_url => true
  
  # By default order the photos by when they were created
  default_scope :order => "created_at desc"
  
  
  has_many :photos
  
end
