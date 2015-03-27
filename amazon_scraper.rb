#!/usr/bin/env ruby

require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = "http://www.amazon.in/s/ref=sr_nr_n_0?fst=as%3Aoff&rh=n%3A976419031%2Cn%3A1805560031%2Ck%3Amobiles&keywords=mobiles&ie=UTF8&qid=1427285699&rnid=976420031"
doc = Nokogiri::HTML(open(url))
c=0
puts doc.at_css("title").text

doc.css(".s-item-container").each do |item|
	title = item.css(".s-access-title").text.delete("\n")
	price = item.css("#s-results-list-atf .a-text-bold").text
	c+= 1
	puts "#{c}) #{title} is priced at #{price}"
end