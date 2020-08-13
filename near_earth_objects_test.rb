require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def setup
    @results = NearEarthObjects.new('2019-03-30')
  end

  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2019 GD4)', results[:astroid_list][0][:name]
  end

  def test_it_exists
    assert_instance_of NearEarthObjects, @results
  end

  def test_it_can_get_largest_asteroid_diameter
    assert_equal 10233, @results.largest_astroid_diameter
  end

  def test_it_can_get_number_of_astroids
    assert_equal 12, @results.total_number_of_astroids
  end

  def test_it_can_get_formatted_astroid_data
    expected = {
                name: '(2019 GD4)',
                diameter: '61 ft',
                miss_distance: '911947 miles'
                }
    assert_equal expected, @results.formatted_astroid_data[0]
    assert_equal 12, @results.formatted_astroid_data.length
  end
end
