from toadsnfrogs import *
from tree import build_game_tree
import copy


def game():
    board = ['t1', 't2', '#', '#', 'f1', 'f2']
    number_animals = 2
    can_move = True
    animal_type = FROG
    tree = build_game_tree(
        copy.deepcopy(board),
        animal_type,
        number_animals
    )
    print("Game Tree:\n" + str(tree))
    print("Starting game:\n")
    print(str(board) + " start")
    while can_move:
        can_move, new_board = try_take_turn(
            board, animal_type, 1, number_animals
        )
        print(str(new_board) + " turn by: " + animal_type)
        animal_type = swap_animal_type(animal_type)

    print(animal_type + " won!")


if __name__ == '__main__':
    game()
