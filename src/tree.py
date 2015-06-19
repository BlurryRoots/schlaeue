import toadsnfrogs as tf
import copy

def main():
	board = ['t1', 't2', '#', 'f1', 'f2']
	number_animals = 2
	animal_type = tf.TOAD

	print(tf.build_game_tree(board, animal_type, number_animals))

if __name__ == '__main__':
	main()
