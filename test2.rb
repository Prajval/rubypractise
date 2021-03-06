class CellGame
  def initialize(size)
    @size = size; @archive = []
    @grid = Array.new(size) { Array.new(size) { rand(3).zero? } }
  end

  def lives_on?(row, col)
    neighborhood = (-1..1).map { |r| (-1..1).map { |c| @grid[row + r] && @grid[row + r][col + c] } }
    its_alive = neighborhood[1].delete_at(1)
    neighbors = neighborhood.flatten.count(true)
    neighbors == 3 || neighbors == 2 && its_alive
  end

  def next_gen
    (0...@size).map { |row| (0...@size).map { |col| lives_on?(row, col) } }
  end

  def play
    tick = 0; incr = 1
    loop do
      @archive.include?(@grid) ? incr = 0 : @archive << @grid
      sleep(1); system "clear"; @grid = next_gen
      puts "tick - #{tick += incr}"
      @size.times do |y|
        @size.times do |x|
          putc @grid[y][x] ? "X" : "*"
        end
        puts ""
      end

    end
  end
end

cg = CellGame.new 10
cg.play