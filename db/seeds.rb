# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

@main = Account.create!({ 
                :name      => 'Photo site',
                :domain => 'photo.local',
                :phone     => '0410 42339',
                :email     => "contact@mrdougal.com" 
              })

@admin = @main.users.create!({
                :username              => 'Mr Dougal', 
                :email                 => "contact@mrdougal.com",
                :password              => 'password', 
                :password_confirmation => "password" 
              })              
              


@newfangled = Account.create!({ 
                :name      => 'Newfangled',
                :domain => 'newfangled.local',
                :phone     => '0410 42339',
                :email     => "hello@newfangled.com.au" 
              })
              
@dougal = @newfangled.users.create!({ 
                :username              => 'Dougal', 
                :email                 => "hello@newfangled.com.au",
                :password              => 'password', 
                :password_confirmation => "password" 
              })


@shine = Account.create!({ 
                :name      => "Shine Photo",
                :domain => 'shinephoto.local',
                :phone     => '0412 3456',
                :email     => "shine@shinephoto.com.au"
              })

@narlea = @shine.users.create!({ 
                :username              => 'Narlea', 
                :email                 => "narlea@shinephone.com.au",
                :password              => 'password', 
                :password_confirmation => "password" 
              })
  
