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

  def test_it_can_get_column_data
    expected = {:name=>{:label=>"Name", :width=>17},
                :diameter=>{:label=>"Diameter", :width=>8},
                :miss_distance=>{:label=>"Missed The Earth By:", :width=>20}}

    assert_equal expected, @table.column_data
  end

  def test_it_can_get_header
    expected = "| Name              | Diameter | Missed The Earth By: |"
    assert_equal expected, @table.header
  end

  def test_it_can_get_divider
    expected = "+-------------------+----------+----------------------+"
    assert_equal expected, @table.divider
  end

  # def test_it_can_get_table_rows
  #   expected =
  # '| (2019 GD4)        | 61 ft    | 911947 miles         |
  # | (2019 GN1)        | 147 ft   | 9626470 miles        |
  # | (2019 GN3)        | 537 ft   | 35277204 miles       |
  # | (2019 GB)         | 81 ft    | 553908 miles         |
  # | (2019 FQ2)        | 70 ft    | 2788140 miles        |
  # | (2011 GE3)        | 123 ft   | 35542652 miles       |
  # | (2019 FT)         | 512 ft   | 5503325 miles        |
  # | (2019 FS1)        | 134 ft   | 6241521 miles        |
  # | 141484 (2002 DB4) | 10233 ft | 37046029 miles       |
  # | (2011 GK44)       | 147 ft   | 10701438 miles       |
  # | (2012 QH8)        | 1071 ft  | 37428269 miles       |
  # | (2019 UZ)         | 51 ft    | 37755577 miles       |'
  #
  #   assert_equal expected, @table.rows
  # end
  # 
  # def test_it_can_make_full_table
  #     expected =
  #   "+-------------------+----------+----------------------+
  #   | Name              | Diameter | Missed The Earth By: |
  #   | (2019 GD4)        | 61 ft    | 911947 miles         |
  #   | (2019 GN1)        | 147 ft   | 9626470 miles        |
  #   | (2019 GN3)        | 537 ft   | 35277204 miles       |
  #   | (2019 GB)         | 81 ft    | 553908 miles         |
  #   | (2019 FQ2)        | 70 ft    | 2788140 miles        |
  #   | (2011 GE3)        | 123 ft   | 35542652 miles       |
  #   | (2019 FT)         | 512 ft   | 5503325 miles        |
  #   | (2019 FS1)        | 134 ft   | 6241521 miles        |
  #   | 141484 (2002 DB4) | 10233 ft | 37046029 miles       |
  #   | (2011 GK44)       | 147 ft   | 10701438 miles       |
  #   | (2012 QH8)        | 1071 ft  | 37428269 miles       |
  #   | (2019 UZ)         | 51 ft    | 37755577 miles       |
  #   +-------------------+----------+----------------------+"
  #
  #     assert_equal expected, @table.make_full_table
  #   end

end
