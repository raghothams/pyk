class Pyk
  
  def self._who_is(obj, cid)
    if obj.id.blank?
      obj.created_by = cid if obj.attributes.has_key?("created_by")
      obj.updated_by = cid if obj.attributes.has_key?("updated_by")
    else
      obj.updated_by = cid if obj.attributes.has_key?("updated_by")
    end
    return obj
  end
  
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


ActionView::Base.send :include, Pyk::Helpers
ActionView::Base.send :include, Pyk::AddressHelpers
ActionView::Base.send :include, Pyk::AppHelpers
ActionView::Base.send :include, Pyk::DateHelpers
ActionView::Base.send :include, Pyk::NumberHelpers
ActionView::Base.send :include, Pyk::DeviseHelpers