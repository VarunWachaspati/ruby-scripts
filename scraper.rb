#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = "http://www.flipkart.com/mobiles/pr?q=apple&as=on&as-show=on&otracker=start&sid=tyy%2C4io&as-pos=1_1_ic_ap"
doc = Nokogiri::HTML(open(url))
c=0
puts doc.at_css("title").text

doc.css(".browse-product , .fk-font-17.fk-bold").each do |item|
	title = item.css(".fk-display-block").text.delete("\n")
	price = item.css(".fk-font-17").text
	c+= 1
	puts "#{c}) #{title}is priced at #{price}"
end