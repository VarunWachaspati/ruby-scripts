#!/usr/bin/env ruby
require 'open-uri'
require 'nokogiri'

doc = Nokogiri.HTML(open("http://www.vocabulary.com/lists/191545"))

f.close