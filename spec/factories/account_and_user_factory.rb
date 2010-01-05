
# Account
Factory.define :account do |f|
  
  f.subdomain { random_string.to_url }
  f.name { random_string }
  f.email { random_email_address }
  f.phone '+64 2364 077'
  
end

# User
Factory.define :user do |f|

  f.account { |account| account.association(:account) }
  f.username { random_string }
  f.email { random_email_address }
  f.password 'secret'
  f.password_confirmation 'secret'
  
end


