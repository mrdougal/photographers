class Photo < ActiveRecord::Base
  
  
  # Pagination settings
  cattr_accessor :per_page
  @@per_page = 50
  
  # Paperclip settings
  has_attached_file :file, :styles => { :slideshow => ["800x500#", :jpg], 
                                        :medium    => ["160x160#", :jpg],
                                        :thumb     => ["80x80#",   :jpg], 
                                        :tiny      => ["40x40#",   :jpg] },
                           :convert_options => { :all => "-channel RGB -strip -quality 80" }, 
                           :default_url => "/images/missing/:attachment/:style.jpg",
                           :path => "photos/:id/:style/:basename.:extension",
                           # 
                           # Storage on Amazon S3 to save on bandwidth to our server
                           :storage => :s3, 
                           :s3_credentials => "#{Rails.root}/config/s3.yml",
                           :bucket => 'assets.shinephoto.com.au',
                           :url => ":s3_domain_url"


     # validates_attachment_content_type :file, {
     #   :content_type => %r{image}, 
     #   :message => "Image's only please" 
     # }             
                                        

  validates_attachment_presence :file, :message => "You need to upload a file"

  belongs_to :category
  validates_presence_of :category
  
  # alias :set :photo_set  # Because I keep on accidentially typing 'set' instead of 'photo_set'
  
  
  
  
  # By default order the photos by when they were created
  default_scope :order => "created_at desc"
  
  # The list of top photos
  named_scope :best, :order => "rating desc", :limit => 20
  named_scope :top, :limit => 5
  
  
  def to_s
    name
  end
  
  def name
    
    return self.title unless self.title.blank?
    file_name_for_display
  end
  
  def url style
    self.file.url(style, false)
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
  
  def file_name_for_display
    
    # end_pos = self.file_file_name =~ /[.$]/
    # 
    # # Remove the extension and humanize the result
    # self.file_file_name[0...end_pos].humanize
    return 'No file supplied'  if self.file_file_name.nil?

    File.basename(self.file_file_name, ".*").humanize

  end
  
  
end
