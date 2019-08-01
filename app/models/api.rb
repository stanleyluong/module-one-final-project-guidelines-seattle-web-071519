# require 'net/http'
# require 'json'
require 'pry'
require 'rest-client'
require 'json'

# url = 'http://pebble-pickup.herokuapp.com/tweets/random'
# response = RestClient.get(url)
# JSON.parse(response)

class API
    def self.pickupline
        # url = 'http://pebble-pickup.herokuapp.com/tweets/random'
        # uri = URI(url)
        # response = Net::HTTP.get(uri)
        # JSON.parse(response)
        url = 'http://pebble-pickup.herokuapp.com/tweets/random'
        response = RestClient.get(url)
        JSON.parse(response)
        response = response.split(":")[3][0...-6]
        response
    end
end
puts API.pickupline