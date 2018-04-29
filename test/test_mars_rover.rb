require File.expand_path('../../lib/mars_rover', __FILE__)

class TestApp < Minitest::Test
  def setup
    @mars_rover = MarsRover.new
  end

  def test_left
    assert_equal ["1 2 W"], @mars_rover.run(["5 5", "1 2 N", "L"])
  end

  def test_right
    assert_equal ["1 2 E"], @mars_rover.run(["5 5", "1 2 N", "R"])
  end

  def test_move
    assert_equal ["1 3 N"], @mars_rover.run(["5 5", "1 2 N", "M"])
  end

  def test_example_first_rover
    assert_equal ["1 3 N"], @mars_rover.run(["5 5", "1 2 N", "LMLMLMLMM"])
  end

  def test_full_example
    assert_equal ["1 3 N", "5 1 E"], @mars_rover.run(["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"])
  end

  def test_cannot_escape_north
    assert_equal ["1 5 N"], @mars_rover.run(["5 5", "1 2 N", "MMMMMMM"])
  end

  def test_cannot_escape_east
    assert_equal ["5 2 E"], @mars_rover.run(["5 5", "1 2 E", "MMMMMMM"])
  end

  def test_cannot_escape_south
    assert_equal ["1 0 S"], @mars_rover.run(["5 5", "1 2 S", "MMMMMMM"])
  end

  def test_cannot_escape_west
    assert_equal ["0 2 W"], @mars_rover.run(["5 5", "1 2 W", "MMMMMMM"])
  end
end
