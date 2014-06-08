class SpiralMatrix
  DIRECTIONS = [:right, :down, :left, :up].cycle

  def initialize(rows, cols)
    @rows       = rows
    @cols       = cols
    @x          = 0
    @y          = 0
    @direction  = DIRECTIONS.next
  end

  def draw(pad_with = ' ')
    pad_size = total_items.to_s.size

    build_matrix.map do |row|
      row.map{ |cell| cell.to_s.rjust(pad_size, pad_with) }.join(' ')
    end.join("\n")
  end

  private

  def build_matrix
    @matrix ||= begin
      matrix = Array.new(@rows) { Array.new(@cols) }
      
      n = 1

      while n <= total_items do
        matrix[@x][@y] = n
        step!(n, matrix)
        n += 1
      end

      matrix
    end
  end

  def step!(n, matrix)
    x = @x
    y = @y

    case @direction
    when :right
      y += 1
    when :down
      x += 1
    when :left
      y -= 1
    when :up
      x -= 1
    end

    if collided?(x, y, matrix)
      turn_right!
      step!(n, matrix) unless completed?(n)
    else
      @x = x
      @y = y
    end
  end

  def turn_right!
    @direction = DIRECTIONS.next
  end

  def collided?(x, y, matrix)
    x < 0 || y < 0 || x >= @rows || y >= @cols || !matrix[x][y].nil?
  end

  def completed?(n)
    n == total_items
  end

  def total_items
    @rows * @cols
  end

end