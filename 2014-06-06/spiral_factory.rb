class SpiralFactory
  class << self
    def draw(rows, cols)
      assembled = assemble(rows, cols)
      assembled.map{ |r| r.join(' ')}.join("\n")
    end

    private

    def assemble(rows, cols)
      matrix = Array.new(rows, Array.new(cols, 0))
      matrix[0][0] = 1

      coords = [0,0,:east]
      n = 1

      @next_step = RightTurn.new(rows, cols)

      while (coords = @next_step.next_step(coords[0], coords[1], coords[2], matrix)) do
        n += 1
        matrix[coords[0]][coords[1]] = n
      end      

      matrix
    end    
  end
end

class RightTurn
  DIRECTIONS = [:east, :south, :west, :north]

  def initialize x_size, y_size
    @x_size = x_size
    @y_size = y_size
  end

  def next_step (x, y, direction, matrix)
    next_x, next_y = walk(direction, x, y)
    
    if !(0..(@x_size - 1)).to_a.include?(next_x) || !(0..(@y_size - 1)).to_a.include?(next_y)
      direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
      next_x, next_y = walk(direction, x, y)
    elsif matrix[next_x][next_y] != 0
      direction = DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
      next_x, next_y = walk(direction, x, y)
    end

    if matrix[next_x,next_y] == 0
      [next_x, next_y, direction]
    else
      nil
    end
  end

  def walk direction, x, y
    next_x = x
    next_y = y

    case direction
      when :north
        next_x += 1
      when :south
        next_x -= 1
      when :east
        next_y += 1
      when :west
        next_y -= 1
    end

    [next_x, next_y]
  end

end