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

board = ["X", " ", " ", "O", "O", "O", "X", "X", " "]

def won?(board)
  WIN_COMBINATIONS.each do |index|
  if index.all?{|i| board[i] == "X"}
    return index
    elsif index.all?{|i| board[i] == "O"}
      return index
    end
  end
  return false
end


#def full?(board)
#   board.all? {|i| i == "X" || i == "O"}
#end


def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end


def draw?(board)  
  !(won?(board)) && full?(board)
end


def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
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
