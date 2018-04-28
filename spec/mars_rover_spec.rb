require 'rspec'
require_relative '../lib/mars_rover'

# 3
# 2
# 1
# 0 1 2 3

describe 'MarsRovers' do

  let(:rover) { MarsRover.new(:N, 0, 0) }

  context 'properties' do
    it 'has a compass' do
      expect(rover).to respond_to :compass
    end

    it 'has coordinates' do
      expect(rover).to respond_to :position
    end

    it 'starts at concrete position and compass' do
      expect(rover.position).to include(x: 0, y: 0)
      expect(rover.compass).to eql :N
    end
  end

  context 'turns left' do
    it 'point to WEST when turn left from NORTH' do
      rover = MarsRover.new(:N,0,0)
      rover.execute 'l'
      expect(rover.compass).to eql :W
    end

    it 'point to SOUTH when turn left from WEST' do
      rover = MarsRover.new(:W,0,0)
      rover.execute 'l'
      expect(rover.compass).to eql :S
    end

    it 'point to EAST when turn left from SOUTH' do
      rover = MarsRover.new(:S,0,0)
      rover.execute 'l'
      expect(rover.compass).to eql :E
    end

    it 'point to NORTH when turn left from EAST' do
      rover = MarsRover.new(:E,0,0)
      rover.execute 'l'
      expect(rover.compass).to eql :N
    end
  end

  context 'turns right' do
    it 'point to EAST when turn right from NORTH' do
      rover = MarsRover.new(:N,0,0)
      rover.execute 'r'
      expect(rover.compass).to eql :E
    end

    it 'point to SOUTH when turn right from EAST' do
      rover = MarsRover.new(:E,0,0)
      rover.execute 'r'
      expect(rover.compass).to eql :S
    end

    it 'point to WEST when turn right from SOUTH' do
      rover = MarsRover.new(:S,0,0)
      rover.execute 'r'
      expect(rover.compass).to eql :W
    end

    it 'point to NORTH when turn right from WEST' do
      rover = MarsRover.new(:W,0,0)
      rover.execute 'r'
      expect(rover.compass).to eql :N
    end
  end

  context 'moves forward' do
    it 'moves to north' do
      rover = MarsRover.new(:N,1,1)
      rover.execute('f')
      expect(rover.position).to include(x: 1, y: 0)
      expect(rover.compass).to be :N
    end

    it 'moves to east' do
      rover = MarsRover.new(:E,1,1)
      rover.execute('f')
      expect(rover.position).to include(x: 2, y: 1)
      expect(rover.compass).to be :E
    end

    it 'moves to south' do
      rover = MarsRover.new(:S,1,1)
      rover.execute('f')
      expect(rover.position).to include(x: 1, y: 2)
      expect(rover.compass).to be :S
    end

    it 'moves to west' do
      rover = MarsRover.new(:W,1,1)
      rover.execute('f')
      expect(rover.position).to include(x: 0, y: 1)
      expect(rover.compass).to be :W
    end
  end

end
