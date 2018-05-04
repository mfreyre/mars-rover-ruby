require File.expand_path('../../lib/mars_rover', __FILE__)
require File.expand_path('../../lib/position', __FILE__)
require File.expand_path('../../lib/direction', __FILE__)

class TestApp < Minitest::Test
  def setup
    @mars_rover = MarsRover.new
  end

  def test_left
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["l"])
    assert_equal Direction.new("West"), mars_rover.direction
    assert_equal position, mars_rover.position
  end

  def test_right
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["r"])
    assert_equal Direction.new("East"), mars_rover.direction
    assert_equal position, mars_rover.position
  end

  def test_move_one_forward
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["f"])
    assert_equal Direction.new("North"), mars_rover.direction
    assert_equal Position.new(0, 1), mars_rover.position
  end

  def test_move_backward
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["b"])
    assert_equal Direction.new("North"), mars_rover.direction
    assert_equal Position.new(0, -1), mars_rover.position
  end
  def test_move_one_forward_two_backward
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["f", "b", "b"])
    assert_equal Direction.new("North"), mars_rover.direction
    assert_equal Position.new(0, -1), mars_rover.position
  end

  def test_move_one_forward_two_backward_turn_left
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["f", "b", "b", "l"])
    assert_equal Direction.new("West"), mars_rover.direction
    assert_equal Position.new(0, -1), mars_rover.position
  end

  def test_turn_left_and_go_forward
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["l", "f", "f", "f"])
    assert_equal Direction.new("West"), mars_rover.direction
    assert_equal Position.new(-3, 0), mars_rover.position
  end

  def test_turn_right_and_go_forward
    position = Position.new(0,0)
    direction = Direction.new("North")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["r", "f", "f", "f"])
    assert_equal Direction.new("East"), mars_rover.direction
    assert_equal Position.new(3, 0), mars_rover.position
  end

  def test_do_a_lot_of_silly_stuff
    position = Position.new(0,0)
    direction = Direction.new("South")
    mars_rover = MarsRover.new position, direction
    mars_rover.execute(["r", "f", "f", "f", "b", "r"])
    assert_equal Direction.new("North"), mars_rover.direction
    assert_equal Position.new(-2, 0), mars_rover.position
  end

end
