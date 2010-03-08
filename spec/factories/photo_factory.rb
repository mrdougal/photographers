

Factory.define :photo do |f|
  
  f.file { File.new(File.join(fixture_path, 'photos','portrait.png')) }
  f.association :category
  f.association :photo_set
  
end