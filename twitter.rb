#!/usr/bin/env ruby 

require 'rubygems'
require 'twitter'

client = Twitter::Streaming::Client.new do |config|
	config.consumer_key = "n9gyl4lYTW1hLnG9dCQMwzNym"
	config.consumer_secret = "RAY3siOImj3FEFf655MFxkpuSqIm7gGkFSHmxZUncAJFPTd39S"
	config.access_token = "2201046097-HTETnsL4KUgQWpymSgpSpkQ8qCpWOrshkO7kbTj"
	config.access_token_secret = "lCAoj4Z8Zunb8Als7nr5JMzKpZ50VbcjM50l2FTmJ2raU"
end	

#topics = ["IPL", "IPL2015","KKR","MI","CSK","SRH","KXIP","cricket","t20","RR","DD"]
topics = ["netneutrality","savetheinternet"]
client.filter(:track => topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
