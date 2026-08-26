extends Node

# Define suits and their standard card count (usually 1 to 14, skipping some numbers or including all)
var suits = ["Circle", "Cross", "Square", "Star", "Triangle"]
var deck = []

func _ready():
	generate_deck()
	shuffle_deck()
	print("Deck generated and shuffled! Total cards: ", deck.size())

func generate_deck():
	deck.clear()
	
	# 1. Generate standard suit cards (Circle, Cross, Square, Star, Triangle)
	for suit in suits:
		# Standard Whot numbers typically include: 1, 2, 3, 4, 5, 7, 8, 10, 11, 12, 13, 14
		# (Note: 6 and 9 are usually omitted in traditional Whot to avoid confusion, or included depending on house rules)
		var numbers = [1, 2, 3, 4, 5, 7, 8, 10, 11, 12, 13, 14]
		for num in numbers:
			var card_data = {
				"type": "suit",
				"suit": suit,
				"number": num
			}
			deck.append(card_data)
			
	# 2. Generate the special "Whot" cards (Number 20, usually 4 or 5 of them)
	for i in range(4):
		var whot_card = {
			"type": "whot",
			"suit": "Whot",
			"number": 20
		}
		deck.append(whot_card)

func shuffle_deck():
	# Randomize the seed and shuffle the array
	randomize()
	deck.shuffle()

func draw_card():
	if deck.size() > 0:
		return deck.pop_back()
	else:
		print("The deck is empty!")
		return null
