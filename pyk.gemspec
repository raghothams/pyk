Gem::Specification.new do |s|
  s.name        = 'pyk'
  s.version     = '0.0.1'
  s.date        = '2013-07-28'
  s.summary     = "Standard library of commonly reused functions across all Pykih Projects."
  s.authors     = ["Pykih Software LLP"]
  s.email       = 'rp@pykih.com'
  s.files       = ["lib/pyk/address.rb", "lib/pyk/api.rb", "lib/pyk/date.rb", "lib/pyk/date_time.rb", "lib/pyk/dj.rb", "lib/pyk/float.rb", "lib/pyk/gravatar.rb", "lib/pyk/number.rb", "lib/pyk/regex.rb", "lib/pyk/spreadsheet.rb", "lib/pyk/string.rb", "lib/pyk/url.rb", "lib/pyk/user.rb", "lib/pyk/address_helpers.rb", "lib/pyk/app_helpers.rb", "lib/pyk/date_helpers.rb", "lib/pyk/devise_helpers.rb", "lib/pyk/number_helpers.rb"]
  s.homepage    = 'https://github.com/pykih/pyk'
  s.required_rubygems_version = '>= 1.3.6'
  s.add_development_dependency("nestful", '1.0.3')
  s.add_development_dependency("nokogiri", '1.5.3')  
  s.add_development_dependency("carmen", '0.2.13')
  s.add_development_dependency("roo", '1.10.1')
end