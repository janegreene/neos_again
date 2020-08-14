require 'faraday'
require 'figaro'
require 'pry'
require 'json'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
  attr_reader :parsed_asteroids_data
  def initialize(date)
    conn = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
    asteroids_list_data = conn.get('/neo/rest/v1/feed')

    @parsed_asteroids_data = JSON.parse(asteroids_list_data.body, symbolize_names: true)[:near_earth_objects][:"#{date}"]
  end

  def largest_astroid_diameter
    largest_astroid = parsed_asteroids_data.max_by do |astroid|
      astroid[:estimated_diameter][:feet][:estimated_diameter_max]
    end
    largest_astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i
  end

  def total_number_of_astroids
    parsed_asteroids_data.length
  end

  def formatted_astroid_data
     parsed_asteroids_data.map do |astroid|
       {
         name: astroid[:name],
         diameter: "#{astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
         miss_distance: "#{astroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
       }
     end
  end
end
