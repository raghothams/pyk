class Pyk
  
end

require 'roo'
require 'pyk/address'
require 'pyk/api'
require 'pyk/date'
require 'pyk/date_time'
require 'pyk/dj'
require 'pyk/float'
require 'pyk/gravatar'
require 'pyk/number'
require 'pyk/regex'
require 'pyk/spreadsheet'
require 'pyk/string'
require 'pyk/url'
require 'pyk/user'
require 'pyk/highcharts'

require 'pyk/address_helpers'
require 'pyk/app_helpers'
require 'pyk/date_helpers'
require 'pyk/devise_helpers'
require 'pyk/number_helpers'

ActionView::Base.send :include, Pyk::AddressHelpers
ActionView::Base.send :include, Pyk::AppHelpers
ActionView::Base.send :include, Pyk::DateHelpers
ActionView::Base.send :include, Pyk::NumberHelpers
ActionView::Base.send :include, Pyk::DeviseHelpers