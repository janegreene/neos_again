require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'table'
require_relative 'near_earth_objects'

class TableTest < Minitest::Test
  def setup
    @results = NearEarthObjects.new('2019-03-30').formatted_astroid_data
    @table = Table.new(@results)
  end

  def test_it_exists
    assert_instance_of Table, @table
  end

end
