from toadsnfrogs import *
import copy

def game ():
	board = ['t1', 't2', 't3', '#', '#', 'f1', 'f2', 'f3']
	number_animals = 3
	can_move = True
	animal_type = FROG
	boad_copy = copy.deepcopy(board)
	tree = build_game_tree(
		boad_copy,
		TreeNode(animal_type, 1, boad_copy),
		animal_type,
		number_animals
	)
	print("Game Tree:\n" + str(tree))
	print("Starting game:\n")
	print(board)
	while can_move:
		can_move, new_board = try_take_turn(board, animal_type, 1, number_animals)
		print(new_board)
		animal_type = swap_animal_type(animal_type)

if __name__ == '__main__':
    game()
