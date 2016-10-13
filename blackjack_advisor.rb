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
  18 =>  ["S", "DS", "DS", "DS", "DS", "S", "S", "H", "H", "S"],
  19 =>  ["S", "S", "S", "S", "DS", "S", "S", "S", "S", "S"],
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
 #removed dealer card options - comments

def check_if_valid(card)
  until (2..10).include?(card.to_i) || ("J", "Q", "K", "A").include?(card.upcase)
    puts "Not valid entry, please try again"
    card = gets.chomp
  end
end

def player_hand_type(card1, card2)
  if card1 == card2
    "pair"
  elsif card1.upcase == "A" || card2.upcase == "A"
    "soft"
  else
    "hard"
end


puts "Welcome to blackjack advisor! I'll tell you whether to hit, stand, split,
      double if possible (otherwise hit), or double if possible (otherwise stand)"

loop do
  puts "Please enter your first card"
  user_card1 = check_if_valid(gets.chomp)
  puts "Please enter your second card"
  user_card2 = check_if_valid(gets.chomp)
  puts "Please enter the dealer's card"
  dealer_card1 = check_if_valid(gets.chomp)

hand_type = player_hand_type(user_card1, user_card2)

case hand_type
  when "pair"
    if card1.upcase == "A"
      move = "P"
    else
      move = player_pair[card1.to_i][dealer_card1.to_i-2]
    end
  when "soft"
  when "hard"
end



  puts "Your optimal move is to #{optimal_move}"

  break unless play_again == "y"
end
