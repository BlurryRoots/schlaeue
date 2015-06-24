import toadsnfrogs as tf
import copy


class TreeNode():
    def __init__(self, last_animal_type, animal_id, can_move, board):
        self.last_animal_type = last_animal_type
        self.animal_id = animal_id
        self.can_move = can_move
        self.board = board
        self.alternatives = []

    def add_alternative(self, tree_node):
        self.alternatives.append(tree_node)

    def __str__(self):
        alt_str = "[\n"
        alt_len = len(self.alternatives)
        alt_idx = 1

        for alt in self.alternatives:
            alt_str = alt_str + str(alt)

            if alt_idx < alt_len:
                alt_str = alt_str + ","

            alt_str = alt_str + "\n"
            alt_idx = alt_idx + 1

        alt_str = alt_str + "]"

        board_len = len(self.board)
        board_idx = 1
        board_str = "["
        for token in self.board:
            board_str = board_str + "\"" + token + "\""

            if board_idx < board_len:
                board_str = board_str + ","

            board_idx = board_idx + 1

        board_str = board_str + "]"

        return (
            "{\n"
            + "\t\"board\": " + board_str + ",\n"
            + "\t\"last_animal_type\": \"" + self.last_animal_type + "\",\n"
            + "\t\"animal_id\": " + str(self.animal_id) + ",\n"
            + "\t\"alternatives\": " + alt_str + ",\n"
            + "\t\"can_move\": " + str(self.can_move).lower()
            + "\n}"
        )


def build_game_tree(board, animal_type, number_animals):
    animal_id = 1
    had_turn = False
    root = TreeNode(animal_type, -1, False, copy.deepcopy(board))

    # check all alternatives for this round
    while animal_id <= number_animals:
        name = animal_type + str(animal_id)
        pos = list.index(board, name)
        step_width = tf.can_move(board, pos)

        # animal can move
        if 0 != step_width:
            had_turn = True
            moved_board = tf.move(copy.deepcopy(board), pos, step_width)
            moved_node = TreeNode(
                animal_type, animal_id, True, copy.deepcopy(moved_board)
            )
            # let opponent take turn to this alternative
            opponent_node = build_game_tree(
                moved_board,
                tf.swap_animal_type(animal_type),
                number_animals
            )
            moved_node.add_alternative(opponent_node)
            root.add_alternative(moved_node)

        animal_id = animal_id + 1

    if had_turn:
        root.can_move = True

    return root


def main():
    board = ['t1', 't2', 't3', '#', '#', '#', 'f1', 'f2', 'f3']
    number_animals = 3
    animal_type = tf.TOAD

    print(build_game_tree(board, animal_type, number_animals))


if __name__ == '__main__':
    main()
