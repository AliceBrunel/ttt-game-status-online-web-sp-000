# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


def won?(board)
    WIN_COMBINATIONS.each do |winning_array|
    win_index_1 = winning_array[0]
    win_index_2 = winning_array[1]
    win_index_3 = winning_array[2]
        #puts "winning array #{winning_array} first index is #{win_index_1} second index is #{win_index_2} third index is #{win_index_3}"
        
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
        #puts "for board, check #{position_1}, #{position_2}, #{position_3}"
      if
        (position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O")
        return winning_array
      elsif 
        board.all?{|indexes| indexes == (" " || "")}
        return false
      else
        false
      end
    end
end


def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end


def draw?(board)
  !(won?(board)) && full?(board)
  return true
end


def over?(board)
    if full?(board) == true
      return true
    end
  return false
end


def winner(board)
 if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end
