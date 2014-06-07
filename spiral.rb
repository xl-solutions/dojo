# Algoritmo Dojo 06/06/14

class Spiral
  def initialize(x,y)
    @rows = x
    @cols = y
    @ring = 0
    @counter = 1
    @max = x*y

    @the_great_array = Array.new(y)

    @the_great_array.map! { |i| Array.new(x) }

    run(@rows, @cols, @ring, @counter, @max, @the_great_array)

    @the_great_array.each_with_index do |row, i|
      row.each do |num|
        print "#{num}" + " "*(5-num.to_s.size.to_i)
      end
      print "\n"
    end
  end

  def run(rows, cols, ring, counter, max, the_great_array)
    
    # Linha horizontal superior (vai)
    (ring..((rows-1)-ring)).each do |i|
      the_great_array[ring][i] = counter
      counter += 1
    return if counter > max
    end


    # Linha vertical direita (desce)
    ((0+1+ring)..((cols-2)-ring)).each do |i|
      the_great_array[i][((rows-1)-ring)] = counter
      counter += 1
    return if counter > max
    end


    # Linha horizontal inferior (volta)
    r = (((rows-1)-ring)..ring)

    (r.first).downto(r.last).each do |i|
      the_great_array[((cols-1)-ring)][i] = counter
      counter += 1
    return if counter > max
    end


    # Linha vertical esquerda (sobe)
    r = (((cols-2)-ring)..(ring+1))

    (r.first).downto(r.last).each do |i|
      the_great_array[i][ring] = counter
      counter += 1
    return if counter > max
    end


    ring += 1

    run(rows, cols, ring, counter, max, the_great_array)
  end
end

Spiral.new(7,5)