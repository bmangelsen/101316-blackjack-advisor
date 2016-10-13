player_hard = {
  5  =>	 ["H", "H", "H",	"H", "H",	"H", "H",	"H", "H", "H"],
  6  =>	 ["H", "H", "H",	"H", "H",	"H", "H",	"H", "H", "H"],
  7	 =>  ["H", "H", "H",	"H", "H",	"H", "H",	"H", "H", "H"],
  8	 =>  ["H", "H", "H", "Dh", "Dh", "H", "H", "H", "H", "H"],
  9	 =>  ["Dh", "Dh", "Dh", "Dh", "Dh", "H", "H", "H",	"H", "H"],
  10 =>	 ["Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "H", "H"],
  11 =>	 ["Dh",	"Dh",	"Dh",	"Dh",	"Dh",	"Dh",	"Dh",	"Dh",	"Dh",	"Dh"],
  12 =>  ["H", "H", "S", "S", "S", "H", "H", "H", "H", "H"],
  13 =>  ["S", "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  14 =>  ["S", "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  15 =>  ["S", "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  16 =>  ["S", "S", "S", "S", "S", "H", "H", "H", "H", "H"],
  17 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  18 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  19 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  20 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  21 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"]
}

player_soft = {
  13 =>  ["H", "H", "DH", "DH", "DH", "H", "H", "H", "H", "H"],
  14 =>  ["H", "H", "DH", "DH", "DH", "H", "H", "H", "H", "H"],
  15 =>  ["H", "H", "DH", "DH", "DH", "H", "H", "H", "H", "H"],
  16 =>  ["H", "H", "DH", "DH", "DH", "H", "H", "H", "H", "H"],
  17 =>  ["DH", "DH", "DH", "DH", "DH", "H", "H", "H", "H", "H"],
  18 =>  ["S", "Ds", "Ds", "Ds", "Ds", "S", "S", "H", "H", "S"],
  19 =>  ["S", "S", "S", "S", "Ds", "S", "S", "S", "S", "S"],
  20 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  21 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"]
}

player_pair = {
  2  =>	 ["P", "P", "P", "P", "P", "P", "H", "H", "H", "H"],
  3  =>	 ["P", "P", "P", "P", "P", "P", "P", "H", "H", "H"],
  4  =>	 ["H", "H", "P", "P", "P", "H", "H", "H", "H", "H"],
  5  =>	 ["Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "Dh", "H", "H"],
  6  =>	 ["P", "P", "P", "P", "P", "P", "H", "H", "H", "H"],
  7  =>	 ["P", "P", "P", "P", "P", "P", "P", "H", "S", "H"],
  8  =>	 ["P", "P", "P", "P", "P", "P", "P", "P", "P", "P"],
  9  =>	 ["P", "P", "P", "P", "P", "S", "P", "P", "S", "S"],
  10 =>  ["S", "S", "S", "S", "S", "S", "S", "S", "S", "S"],
  "A"  =>	 ["P", "P", "P", "P", "P", "P", "P", "P", "P", "P"]
}

moves = {
  "H" => "Hit",
  "S" => "Stand",
  "P" => "Split",
  "Dh" => "Double if possible (otherwise hit)",
  "Ds" => "Double if possible (otherwise stand)"
}

face_cards = ["J", "Q", "K", "A"]
face_cards_no_ace = ["J", "Q", "K"]

def check_if_valid(card, face_cards)
  until (2..10).include?(card.to_i) || face_cards.include?(card.upcase)
    puts "Not valid entry, please try again"
    card = gets.chomp
  end
end

def player_hand_type(card1, card2)
  if card1 == card2
    "pair"
  elsif card1 == 11 || card2 == 11
    "soft"
  else
    "hard"
  end
end

def check_if_face(card, face_cards_no_ace) #include in comments
  if face_cards_no_ace.include?(card.upcase)
    card = 10
  elsif card.upcase == "A"
    card = 11
  else
    card.to_i
  end
end

def move(hand_type, user_card1, user_card2, dealer_card1)
  player_total = user_card1 + user_card2
  hand_type[player_total][dealer_card1-2]
end

def new_game(move)
  puts "Your optimal move is to #{move}"
  puts "Would you like to play again? (y/n)"
  gets.chomp
end

puts "Welcome to blackjack advisor! I'll tell you whether to hit, stand, split, double if possible (otherwise hit), or double if possible (otherwise stand)"

loop do
  puts "Please enter your first card"
  user_card1 = check_if_valid(gets.chomp, face_cards)
  puts "Please enter your second card"
  user_card2 = check_if_valid(gets.chomp, face_cards)
  puts "Please enter the dealer's card"
  dealer_card1 = check_if_valid(gets.chomp, face_cards)

  user_card1 = check_if_face(user_card1, face_cards_no_ace) #include in comments
  user_card2 = check_if_face(user_card2, face_cards_no_ace)
  dealer_card1 = check_if_face(dealer_card1, face_cards_no_ace)

  player_hand_type = player_hand_type(user_card1, user_card2)

  case player_hand_type
    when "pair"
      move = move(player_pair, user_card1, user_card2, dealer_card1)
    when "soft"
      move = move(player_soft, user_card1, user_card2, dealer_card1)
    when "hard"
      move = move(player_hard, user_card1, user_card2, dealer_card1)
  end

  optimal_move = moves[move]
  play_again = new_game(optimal_move)

  break unless play_again == "y"
end
