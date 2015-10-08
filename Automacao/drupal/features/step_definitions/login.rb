#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))

Dado(/^que (?:|eu) acesse o (.+)$/) do |page_name|
  visit path_to(page_name)
end

Quando(/^eu informar no campo "([^"]*)" com "([^"]*)"$/) do |field, value|
   fill_in(field, :with => value)
end