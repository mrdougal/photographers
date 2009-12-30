

Factory.define :photo do |f|
  
  f.file { File.new(File.join(fixture_path, 'photos','png.png')) }
  
end