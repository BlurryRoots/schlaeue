EMPTY = '#'
TOAD = 't'
FROG = 'f'


def is_toad(board, pos):
    name = board[pos]
    return TOAD == name[:1]


def is_frog(board, pos):
    name = board[pos]
    return FROG == name[:1]


def is_empty(board, pos):
    name = board[pos]
    return EMPTY == name[:1]


def is_in_bounds(board, pos):
    return len(board) > pos


def swap(board, pos, otherpos):
    board[pos], board[otherpos] = board[otherpos], board[pos]
    return board


def can_move(board, pos):
    if not is_in_bounds(board, pos):
        return 0

    animal_type = board[pos][:1]

    sign = 0
    if TOAD == animal_type:
        sign = 1
    elif FROG == animal_type:
        sign = -1
    else:
        raise TypeError("Unkown animal type!")

    step_width = sign
    if (is_in_bounds(board, pos + step_width)
            and is_empty(board, pos + step_width)):
        return step_width

    step_width = step_width + sign
    if (is_in_bounds(board, pos + step_width)
            and is_frog(board, pos + step_width)
            and is_empty(board, pos + step_width)):
        return step_width

    return 0


def move(board, pos, step_width):
    return swap(board, pos, pos + step_width)


def take_turn(board, animal_type, nr):
    name = animal_type + str(nr)
    pos = list.index(board, name)

    step_width = can_move(board, pos)
    if 0 != step_width:
        return True, move(board, pos, step_width)
    else:
        return False, board


def try_take_turn(board, animal_type, animal_id, number_animals):
    status, new_board = take_turn(board, animal_type, animal_id)
    if status:
        return True, new_board
    if not status and animal_id < number_animals:
        return try_take_turn(board, animal_type, animal_id + 1, number_animals)
    else:
        return False, new_board


def swap_animal_type(animal_type):
    if FROG == animal_type:
        return TOAD
    elif TOAD == animal_type:
        return FROG
    else:
        raise TypeError("NOOOOOO!")


class TreeNode():
    """keks"""
    def __init__(self, last_animal_type, animal_id, board):
        self.last_animal_type = last_animal_type
        self.animal_id = animal_id
        self.board = board
        self.alternatives = []

    def add_alternative(self, tree_node):
        list.append(self.alternatives, tree_node)

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

        return ("{\n"
            + "\t\"board\": " + str(self.board) + "\n"
            + "\t\"last_animal_type\": " + self.last_animal_type + "\n"
            + "\t\"animal_id\": " + str(self.animal_id) + "\n"
            + "\t\"alternatives\": " + alt_str
            + "\n}")


import copy
def build_game_tree (board, node, animal_type, number_animals):
    animal_id = 1
    while number_animals >= animal_id:
        valid, new_board = take_turn(board, animal_type, animal_id)
        if valid:
            new_node = TreeNode(animal_type, animal_id, new_board)
            # play next turn
            node.add_alternative(
                build_game_tree(
                    new_board,
                    new_node,
                    swap_animal_type(animal_type),
                    number_animals
                )
            )
        animal_id = animal_id + 1

    return node
