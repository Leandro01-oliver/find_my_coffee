require 'rest-client'
require 'json'


class GetGoogleCoffeeDetailsService
    def initialize(latitude, longitude)
        @latitude = latitude
        @longitude = longitude
    end

    def call()
        begin
            key = #{Rails.application.credentials.google_secret_key}
            location = "#{latitude}, #{longitude}"
            radius = "5000"
            base url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shops&#{location}&#{radius}&#{key}"
            response = RestClient.get base_url
            JSON.parse(response.body)
        rescue RestClient::ExceptionWithResponde =>
            e.response
    end
end