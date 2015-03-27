#!/usr/bin/env/ ruby

require 'nokogiri'
require 'open-uri'

puts "Enter the Search Query : "
search_query = gets.chomp


url = "https://www.google.co.in/#q=#{search_query}"
item = Nokogiri::HTML(open(url))
#count=0
puts item
puts item.at_css("title").text
puts "Google Search Results for #{search_query}"
#puts doc.css(".s div , .r , ._Rm , .st , .r a").text
#doc.css(".s div , .r , ._Rm , .st , .r a").each do |item|
	link = item.css("._Rm").text
	tag = item.css(".r a").text
	description = item.css(".st").text
	puts tag
	#c+=1
	puts " #{tag}, #{link}, #{description} "
#end