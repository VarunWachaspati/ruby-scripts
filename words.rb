#!/usr/bin/env ruby
require 'open-uri'
require 'nokogiri'

doc = Nokogiri.HTML(open("http://www.vocabulary.com/lists/191545"))

f = File.open("vocabulary.txt","w")
f<<doc
f.close
