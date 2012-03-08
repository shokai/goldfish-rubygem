#!/usr/bin/env ruby
$:.unshift File.dirname(__FILE__)+'/../lib'
require 'rubygems'

require 'goldfish'

poi = GoldFish::Poi.new
puts poi.post('test', Time.now.to_s)
