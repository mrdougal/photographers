
# User
Factory.define :user do |f|

  f.username { random_string }
  f.email { random_email_address }
  f.password 'secret'
  f.password_confirmation 'secret'
end


