# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


users = User.create!([ 
  { :username => 'Dougal', 
    :email => "hello@newfangled.com.au",
    :password => 'password', 
    :password_confirmation => "password" 
  },{ 
    :username => 'Trev', 
    :password => 'password', 
    :password_confirmation => "password",
    :email => "trev@newfangled.com.au"
 }
  ])
