TOAD = 't'
FROG = 'f'
EMPTY = '#'

board = ['t1', 't2', '#', 'f1', 'f2']

def is_toad (board, pos):
	return TOAD == board[pos]

def is_frog (board, pos):
	return FROG == board[pos]

def is_empty (board, pos):
	return EMPTY == board[pos]

def is_in_bounds (board, pos):
	return len (board) > pos

def swap (board, pos, otherpos):
	board[pos], board[otherpos] = board[otherpos], board[pos]
	return board

def move (board, animal, nr):
	name = animal + str (nr)
	pos = list.index (board, name)

	if not is_in_bounds (board, pos + 1):
		return False

	if TOAD == animal:
		if is_empty (board, pos + 1):
			return True, swap (board, pos, pos + 1)
		if is_frog (board, pos + 1) \
		and is_in_bounds (board, pos + 2) and is_empty (board, pos + 2):
			return True, swap (board, pos, pos + 2)
		else:
			return False, board
	if FROG == animal:
		if is_empty (board, pos - 1):
			return True, swap (board, pos, pos - 1)
		if is_toad (board, pos - 1) \
		and is_in_bounds (board, pos - 2) and is_empty (board, pos - 2):
			return True, swap (board, pos, pos - 2)
		else:
			return False, board
	else:
		raise Error ("Unkown animal type!")

success, board = move (board, FROG, 1)
if success:
	print (board)
else:
	print ("nope")

success, board = move (board, TOAD, 2)
if success:
	print (board)
else:
	print ("nope")
