require 'httparty'

response =HTTParty.get('http://www.redtube.com')
#puts response.body
puts response.code
puts response.message
