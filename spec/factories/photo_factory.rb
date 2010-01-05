

Factory.define :photo do |f|
  
  f.account { |account| account.association(:account) }
  f.file { File.new(File.join(fixture_path, 'photos','portrait.png')) }
  
end