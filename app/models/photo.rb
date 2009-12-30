class Photo < ActiveRecord::Base
  
  # Paperclip settings
  has_attached_file :file, :convert_options => { :all => "-channel RGB" }, 
                            :default_url => "/images/missing/:attachment/:style.png",
                            :whiny => true,
                            :styles => { :large =>  ["600x400", :png],
                                         :medium => ["300x300", :png], 
                                         :thumb =>  ["100x100", :png], 
                                         :tiny =>   ["40x40", :png] }
                            
  
  validates_attachment_content_type :file, {
    :content_type => %r{image}, 
    :message => "Image's only please" 
  }             

  # For permalinks on the photo
  acts_as_url :name, :url_attribute => :permalink, :sync_url => true
  
  # Taggings
  acts_as_taggable_on :tags
  
  
  def to_s
    name ||= 'bad name'
  end
  
  
end
