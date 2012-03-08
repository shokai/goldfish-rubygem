#!/usr/bin/env ruby
$:.unshift File.dirname(__FILE__)+'/../lib'
require 'rubygems'

require 'goldfish'


poi = GoldFish::Poi.new
puts data = poi.get('test')
data.gsub!("'", "")

puts cmd = "say '#{data}'"
system cmd
