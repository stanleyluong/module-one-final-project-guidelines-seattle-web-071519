class API
    def self.pickupline
        url = 'http://pebble-pickup.herokuapp.com/tweets/random'
        response = RestClient.get(url)
        JSON.parse(response)
        response = response.split(":")[3][0...-6]
        response
    end
end