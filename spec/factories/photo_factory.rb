

Factory.define :photo do |f|
  
  f.image { File.new(File.join(fixture_path, 'photos','png.png')) }
  
end