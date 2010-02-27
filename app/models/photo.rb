class Photo < ActiveRecord::Base
  
  # Pagination settings
  cattr_accessor :per_page
  @@per_page = 30
  
  # Paperclip settings
  has_attached_file :file, :convert_options => { :all => "-channel RGB" }, 
                           :url => "/uploaded/photos/:id/:style/:filename", 
                           :default_url => "/images/missing/:attachment/:style.png",
                           :whiny => true,
                           :styles => { :large =>  ["600x400", :png],
                                        :slideshow => ["800#x450#", :png], 
                                        :thumb =>  ["80x80#", :png], 
                                        :tiny =>   ["40x40#", :png] }
                            
  
  validates_attachment_content_type :file, {
    :content_type => %r{image}, 
    :message => "Image's only please" 
  }             

  validates_attachment_presence :file, :message => "You need to upload a file"

  # # This needs to be placed before acts_as_url as it expects their to be a name.
  # before_validation :generate_name_if_required

  # For permalinks on the photo
  # acts_as_url :name, :url_attribute => :permalink, :sync_url => true
  
  # Taggings
  acts_as_taggable_on :categories
  acts_as_taggable_on :sets
  acts_as_taggable_on :tags
  
  
  # By default order the photos by when they were created
  default_scope :order => "created_at desc"
  
  
  # belongs_to :photo_set
  
  
  def to_s
    file_file_name
  end
  
  def name
    file_file_name
  end
  
  def url style
    file.url style, false
  end
  
  # def to_param
  #   permalink
  # end
  
  
  private
  
  # def generate_name_if_required
  #   
  #   return unless self.name.blank?
  #   return if self.file_file_name.blank?
  #   
  #   # We humanise the basename of the filename. (.* removes the extension)
  #   self[:name] = File.basename(self.file_file_name,'.*').gsub(/-/,' ').humanize
  #   
  # end
  
  
end
