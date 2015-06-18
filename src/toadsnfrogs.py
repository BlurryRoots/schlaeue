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

def can_move (board, animal, pos):
    sign = 0
    if TOAD == animal:
        sign = 1
    elif FROG == animal:
        sign = -1
    else:
        raise Error ("Unkown animal type!")

    step_width = sign * 1
    if is_empty (board, pos + step_width):
        return step_width

    step_width = step_width + (sign * 1)
    if is_frog (board, pos + step_width) \
    and is_in_bounds (board, pos + step_width) \
    and is_empty (board, pos + step_width):
        return step_width

    return 0


def move (board, animal_type, nr, step_width):
    name = animal_type + str (nr)
    pos = list.index (board, name)

    swap (board, pos, pos + step_width)

    return board
