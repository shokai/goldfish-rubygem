#!/usr/bin/env ruby
$:.unshift File.dirname(__FILE__)+'/../lib'
require 'rubygems'

require 'goldfish-poi'


poi = GoldFish::Poi.new
poi.get('test'){|res|
  puts res.body
}

