class API
    def self.pickupline
        url = 'http://pebble-pickup.herokuapp.com/tweets/random'
        response = RestClient.get(url)
        JSON.parse(response)
        response = response.split(":")[3][0...-6]
        response
    end
end

# class API2
#     def self.joke
#         url = 'https://sv443.net/jokeapi/category/Any'
#         response = RestClient.get(url)
#         if JSON.parse(response)["type"] == "twopart"
#             puts JSON.parse(response)["setup"]
#             puts JSON.parse(response)["delivery"]
#         else    
#             puts JSON.parse(response)["joke"]
#         end 
       
#     end
#  end

class API2
    def self.joke
        url = 'https://sv443.net/jokeapi/category/Programming'
        response = RestClient.get(url)
        response = JSON.parse(response)
        if response["type"]=="single"
            puts response["joke"]
        else
            puts response["setup"]
            puts response["delivery"]
        end
    end
 end