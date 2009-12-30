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

  validates_attachment_presence :file, :message => "You need to upload a file"

  # For permalinks on the photo
  acts_as_url :name, :url_attribute => :permalink, :sync_url => true
  
  # Taggings
  acts_as_taggable_on :tags
  
  
  before_validation :generate_name_if_required
  
  def to_s
    name
  end
  
  
  private
  
  def generate_name_if_required
    
    return unless self.name.blank?
    return if self.file_file_name.blank?
    
    # We humanise the basename of the filename. (.* removes the extension)
    self[:name] = File.basename(self.file_file_name,'.*').humanize
    
  end
  
  
end
