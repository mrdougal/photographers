class Photo < ActiveRecord::Base
  
  # Pagination settings
  cattr_accessor :per_page
  @@per_page = 30
  
  # Paperclip settings
  has_attached_file :file, :convert_options => { :all => "-channel RGB" }, 
                           :url => "/uploaded/photos/:id/:style/:filename", 
                           :default_url => "/images/missing/:attachment/:style.png",
                           :whiny => true,
                           :styles => { :slideshow => ["800#x450#", :png], 
                                        :medium    => ["160x160#", :png],
                                        :thumb     => ["80x80#", :png], 
                                        :tiny      => ["40x40#", :png] }

                            
  
  # validates_attachment_content_type :file, {
  #   :content_type => %r{image}, 
  #   :message => "Image's only please" 
  # }             

  validates_attachment_presence :file, :message => "You need to upload a file"

  # Taggings
  acts_as_taggable_on :categories
  acts_as_taggable_on :sets
  acts_as_taggable_on :tags
  
  
  # By default order the photos by when they were created
  default_scope :order => "created_at desc"
  

  
  def to_s
    file_file_name
  end
  
  def name
    file_file_name
  end
  
  def url style
    file.url style, false
  end
  
  
  # Don't call this in production. As this is an expensive call to make
  def self.recreate_thumbs
    
    self.find_in_batches( :batch_size => 10 ) do |group|
      group.each do |photo| 
        puts "Recreating thumbnails for #{photo}"
        photo.file.reprocess!
      end
    end
    
  end

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
