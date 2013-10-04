class Pyk
  
  module Rails
    class Engine < ::Rails::Engine
    end
  end
  
end


require 'roo'
require 'pyk/address'
require 'pyk/api'
require 'pyk/date'
require 'pyk/date_time'
require 'pyk/dj'
require 'pyk/gravatar'
require 'pyk/regex'
require 'pyk/spreadsheet'
require 'pyk/url'
require 'pyk/user'
require 'pyk/highcharts'

require 'pyk/helpers'
ActionView::Base.send :include, Pyk::Helpers