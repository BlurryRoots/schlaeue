EMPTY = '#'
TOAD = 't'
FROG = 'f'

def is_toad (board, pos):
    name = board[pos]
    return TOAD == name[:1]

def is_frog (board, pos):
    name = board[pos]
    return FROG == name[:1]

def is_empty (board, pos):
    name = board[pos]
    return EMPTY == name[:1]

def is_in_bounds (board, pos):
    return len (board) > pos

def swap (board, pos, otherpos):
    board[pos], board[otherpos] = board[otherpos], board[pos]
    return board

def can_move (board, animal_type, pos):
    if not is_in_bounds (board, pos):
        return 0

    sign = 0
    if TOAD == animal:
        sign = 1
    elif FROG == animal:
        sign = -1
    else:
        raise Error ("Unkown animal type!")

    step_width = sign
    if is_in_bounds (board, pos + step_width) \
    and is_empty (board, pos + step_width):
        return step_width

    step_width = step_width + sign
    if is_in_bounds (board, pos + step_width) \
    and  is_frog (board, pos + step_width) \
    and is_empty (board, pos + step_width):
        return step_width

    return 0


def move (board, pos, step_width):
    swap (board, pos, pos + step_width)

    return board


def take_turn (board, animal_type, nr):
    name = animal_type + str (nr)
    pos = list.index (board, name)

    step_width = can_move (board, animal_type, pos)
    if 0 != step_width:
        return True, move (board, pos, step_width)
    else:
        return False, board

def try_take_turn (board, animal_type, number_animals):
    animal_id = 1

