
Factory.define :photo_set do |f|
  
  f.name { random_string }
  f.association :category
  
end