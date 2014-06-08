class Spiral
  def initialize(x,y)
    @rows            = x
    @cols            = y
    @ring            = 0
    @max             = x*y
    @counter         = 1
    @the_great_array = Array.new(@cols) { Array.new(@rows) }
  end

  def run
    (@ring..((@rows-1)-@ring)).each do |i|
      @the_great_array[@ring][i] = @counter
      @counter += 1
      return if @counter > @max
    end

    ((@ring+1)..((@cols-2)-@ring)).each do |i|
      @the_great_array[i][((@rows-1)-@ring)] = @counter
      @counter += 1
      return if @counter > @max
    end

    r = (((@rows-1)-@ring)..@ring)
    (r.first).downto(r.last).each do |i|
      @the_great_array[((@cols-1)-@ring)][i] = @counter
      @counter += 1
      return if @counter > @max
    end

    r = (((@cols-2)-@ring)..(@ring+1))
    (r.first).downto(r.last).each do |i|
      @the_great_array[i][@ring] = @counter
      @counter += 1
      return if @counter > @max
    end

    @ring += 1
    
    run
  end

  def draw
    run
    @the_great_array.each do |row|
      row.each do |num|
        print "#{num}" + " "*(5-num.to_s.size.to_i)
      end
      print "\n"
    end
  end
end