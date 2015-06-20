
import copy

EMPTY = '#'
TOAD = 't'
FROG = 'f'


def is_toad(board, pos):
    name = board[pos]
    return TOAD == name[:1]


def is_frog(board, pos):
    name = board[pos]
    return FROG == name[:1]


def is_enemy(board, pos, otherpos):
    if is_frog(board, pos):
        return is_toad(board, otherpos)
    elif is_toad(board, pos):
        return is_frog(board, otherpos)
    else:
        raise TypeError("Only frogs and toads have enemies!")


def is_empty(board, pos):
    name = board[pos]
    return EMPTY == name[:1]


def is_in_bounds(board, pos):
    return len(board) > pos >= 0


def swap(board, pos, otherpos):
    board[pos], board[otherpos] = board[otherpos], board[pos]
    return board


def can_move(board, pos):
    if not is_in_bounds(board, pos):
        return 0

    sign = 0
    if is_toad(board, pos):
        sign = 1
    elif is_frog(board, pos):
        sign = -1
    else:
        raise TypeError("Unkown animal type!")

    # asdf
    target_field = pos + (1 * sign)
    if (is_in_bounds(board, target_field)
            and is_empty(board, target_field)):
        return (1 * sign)

    # can a turn be taken by jumping over an enemy?
    obstical = target_field
    target_field = pos + (2 * sign)
    if (is_in_bounds(board, target_field)
            and is_empty(board, target_field)
            and is_enemy(board, pos, obstical)):
        return (2 * sign)

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
        return try_take_turn(
            board, animal_type, animal_id + 1, number_animals
        )
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
    def __init__(self, last_animal_type, animal_id, board):
        self.last_animal_type = last_animal_type
        self.animal_id = animal_id
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
            + "\t\"alternatives\": " + alt_str
            + "\n}"
        )


def build_game_tree(board, animal_type, number_animals):
    animal_id = 1
    had_turn = False
    root = TreeNode(animal_type, -1, copy.deepcopy(board))

    # check all alternatives for this round
    while animal_id <= number_animals:
        name = animal_type + str(animal_id)
        pos = list.index(board, name)
        step_width = can_move(board, pos)

        # animal can move
        if 0 != step_width:
            had_turn = True
            moved_board = move(copy.deepcopy(board), pos, step_width)
            moved_node = TreeNode(
                animal_type, animal_id, copy.deepcopy(moved_board)
            )
            # let opponent take turn to this alternative
            moved_node.add_alternative(build_game_tree(
                moved_board,
                swap_animal_type(animal_type),
                number_animals
            ))
            root.add_alternative(moved_node)

        animal_id = animal_id + 1

    return root
