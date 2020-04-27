module Maze_Classes

    class Maze

        attr_reader :start_loc, :end_loc, :title
        def initialize(filename)
            @map = load_map(filename)
            @title = load_title(filename)
            @start_loc = find_start
            @end_loc = find_end
        end

        def load_map(filename)
            new_map = Array.new
            File.open(filename).each_line do |line|
                new_line = []
                line.chomp.each_char {|x| new_line << x}
                new_map << new_line
            end
            return new_map
        end

        def load_title(filename)
            title = filename.split(".txt")
            return title[0]
        end

        def print_map
            @map.each do |line|
                line.each {|x| print x}
                puts ""
            end
        end

        def find_start
            idx_y = 0
            idx_x = 0
            @map.each_with_index do |line, line_idx|
                if line.index("S") != nil
                    idx_y = line_idx
                    idx_x = line.index("S")
                    return [idx_y,idx_x]
                end
            end
        end

        def find_end
            idx_y = 0
            idx_x = 0
            @map.each_with_index do |line, line_idx|
                if line.index("E") != nil
                    idx_y = line_idx
                    idx_x = line.index("E")
                    return [idx_y,idx_x]
                end
            end
        end

        def update_map(position,icon)
            @map[position[0]][position[1]] = icon
        end

        def is_open?(position)
            idx_y = position[0]
            idx_x = position[1]
            @map[idx_y][idx_x] == " " ? true : false
        end

        def is_end?(position)
            position == @end_loc ? true : false
        end

    end #End Maze Class

    class Maze_Solver
        
        attr_reader :current_pos
        def initialize(maze)
            @maze = maze
            @current_pos = @maze.start_loc
        end

        def calc_dist
            y_dist = (@maze.end_loc[0] - @maze.start_loc[0]).abs
            x_dist = (@maze.end_loc[1] - @maze.start_loc[1]).abs
            @end_dist = y_dist + x_dist
        end

        def solve
            
        end

    end #End Maze_Solver Class

end #End Module

if __FILE__ == $PROGRAM_NAME
  filename = ARGV[0] || "maze1.txt"
  test_maze = Maze_Classes::Maze.new(filename)
  puts "MAZE: " + test_maze.title
  test_maze.print_map
  puts "Start is at #{test_maze.start_loc}"
  puts "End is at #{test_maze.end_loc}"
  test_solver = Maze_Classes::Maze_Solver.new(test_maze)
  test_solver.solve
end