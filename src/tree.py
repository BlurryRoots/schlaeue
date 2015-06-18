import toadsnfrogs as tf
import copy

def main():
	board = ['t1', 't2', '#', 'f1', 'f2']
	number_animals = 2
	can_move = True

	animal_type = tf.FROG
	print(tf.build_game_tree(
		copy.deepcopy(board),
		tf.TreeNode(animal_type, 1, copy.deepcopy(board)),
		animal_type,
		number_animals
	))

	animal_type = tf.TOAD
	print(tf.build_game_tree(
		copy.deepcopy(board),
		tf.TreeNode(animal_type, 1, copy.deepcopy(board)),
		animal_type,
		number_animals
	))

if __name__ == '__main__':
	main()
