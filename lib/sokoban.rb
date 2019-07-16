# frozen_string_literal: true

require_relative 'config'

def init_board(lvl, worker_pos)
  board_arr = Array.new(LEVELS[lvl].length) { [] }
  (0...LEVELS[lvl].length).to_a.each_index do |i|
    column_num = LEVELS[lvl][i].length
    (0...column_num).to_a.each_index do |j|
      board_arr[i][j] = LEVELS[lvl][i][j]
      if board_arr[i][j] == WORKER_CHAR
        worker_pos[0] = i
        worker_pos[1] = j
      end
    end
  end

  (0...GOALS[lvl].length).to_a.each_index do |i|
    next if i.odd?

    goal_rows = GOALS[lvl][i]
    goal_columns = GOALS[lvl][i + 1]
    if board_arr[goal_rows][goal_columns] == WORKER_CHAR
      board_arr[goal_rows][goal_columns] = WORK_GOAL_CHAR
    elsif board_arr[goal_rows][goal_columns] == BOX_CHAR
      board_arr[goal_rows][goal_columns] = BOX_GOAL_CHAR
    else
      board_arr[goal_rows][goal_columns] = GOAL_CHAR
    end
  end

  board_arr
end

def print_board(board)
  print WALL_CHAR
  board[0].length.times { print WALL_CHAR }
  print WALL_CHAR
  puts ''

  (0...board.length).to_a.each_index do |i|
    print WALL_CHAR
    (0...board[i].length).to_a.each_index do |j|
      print board[i][j]
    end
    print WALL_CHAR
    puts ''
  end

  print WALL_CHAR
  board[-1].length.times { print WALL_CHAR }
  print WALL_CHAR
  puts ''
end

print_board(init_board(1, Array.new(2)))
# print_board([[], []])
