class API
    def self.pickupline
        url = 'http://pebble-pickup.herokuapp.com/tweets/random'
        response = RestClient.get(url)
        JSON.parse(response)
        response = response.split(":")[3][0...-6]
        response
    end
end

class API2
    def self.joke
        url = 'https://official-joke-api.appspot.com/jokes/programming/random'
        response = RestClient.get(url)
        JSON.parse(response)
        response = response[0].split(":")
        setup = response[:setup]
        
        response
    end
end
