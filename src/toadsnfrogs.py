from sys import maxsize


class Player():
    def __init__(self, animal_type):
        self.animal_type = animal_type


class HumanPlayer(Player):
    def next_move(self, board):
        pos = self.ask_move(board)
        steps = board.can_move(pos)
        print('moving {0} by {1} steps'.format(pos, steps))
        return board.move(pos, steps)

    def ask_move(self, board):
        pos = -1
        steps = 0
        while True:
            print('which one do you want to move?')
            raw_choice = input()
            try:
                pos = int(float(raw_choice))
                steps = board.can_move(pos)
            except:
                pass

            if self.animal_type is Toad and steps > 0:
                break
            elif self.animal_type is Frog and steps < 0:
                break
            print('incorrect input, try again!')
        return pos


class ComputerPlayer(Player):
    def next_move(self, board):
        print('thinking...')
        return self.make_move(board)

    def make_move(self, board):
        moves = board.get_possible_moves(self.animal_type.direction)
        print('possible moves: {0}'.format(moves))
        best_move = None
        best_score = 0
        for move in moves:
            score = score_for_move(board, move)
            if score >= best_score:
                best_score = score
                best_move = move
        if best_move is None:
            best_move = moves[0]
        print('moving {0} with score of {1}'.format(best_move, score))
        steps = board.can_move(best_move)
        return board.move(best_move, steps)


class Frog():
    direction = -1

    def __init__(self, nr):
        self._nr = nr

    def __str__(self):
        return 'F{}'.format(self._nr)


class Toad():
    direction = 1

    def __init__(self, nr):
        self._nr = nr

    def __str__(self):
        return 'T{}'.format(self._nr)


class Space():
    def __init__(self):
        self.direction = 0

    def __str__(self):
        return '__'

    def __repr__(self):
        str(self)


class Board():
    def __init__(self, board_list):
        self.board = board_list

    def is_game_over(self, current_player):
        return self.get_possible_moves(current_player) == []

    def is_in_bounds(self, pos):
        return pos >= 0 and pos < len(self.board)

    def is_empty(self, pos):
        return isinstance(self.board[pos], Space)

    def is_toad(self, pos):
        return isinstance(self.board[pos], Toad)

    def is_frog(self, pos):
        return isinstance(self.board[pos], Frog)

    def different_animals(self, pos1, pos2):
        return ((self.is_frog(pos1) and self.is_toad(pos2)) or
                (self.is_toad(pos1) and self.is_frog(pos2)))

    def get_direction(self, pos):
        if self.is_toad(pos):
            return Toad.direction
        elif self.is_frog(pos):
            return Frog.direction
        else:
            return 0

    def get_possible_moves(self, playernum):
        moves = []
        for i in range(len(self.board)):
            if self.board[i].direction == playernum and self.can_move(i):
                moves.append(i)
        return moves

    def can_move(self, pos):
        if not self.is_in_bounds(pos):
            return 0

        direction = self.get_direction(pos)

        if direction == 0:
            return 0

        # check one step
        steps = direction
        if (self.is_in_bounds(pos + steps)
                and self.is_empty(pos + steps)):
            return steps

        # check two steps
        steps = direction * 2
        if (self.is_in_bounds(pos + steps)
                and self.different_animals(pos, pos + direction)
                and self.is_empty(pos + steps)):
            return steps
        return 0

    def move(self, pos, steps):
        board = list(self.board)
        board[pos], board[pos + steps] = board[pos + steps], board[pos]
        return Board(board)

    def __str__(self):
        helper = '[' + ' ,'.join(
            ' ' + str(idx) for idx, x in enumerate(self.board)) + ']\n'
        return helper + '[' + ' ,'.join(str(x) for x in self.board) + ']'

    def __eq__(self, other):
        if isinstance(other, Board):
            return other.board == self.board
        return False


def minimax(board, depth, maximizingPlayer):
    playernum = -1 if maximizingPlayer else 1

    if board.is_game_over(playernum):
        return 100 * playernum  # calculate real score

    if depth == 0:
        return 0

    possible_moves = board.get_possible_moves(playernum)

    if maximizingPlayer:
        bestValue = -maxsize
        for move in possible_moves:
            steps = board.can_move(move)
            board_after_move = board.move(move, steps)
            val = minimax(board_after_move, depth - 1, False)
            bestValue = max(bestValue, val)
        return bestValue
    else:
        bestValue = maxsize
        for move in possible_moves:
            steps = board.can_move(move)
            board_after_move = board.move(move, steps)
            val = minimax(board_after_move, depth - 1, True)
            bestValue = min(bestValue, val)
        return bestValue


def score_for_move(board, move):
    steps = board.can_move(move)
    new_board = board.move(move, steps)
    return minimax(new_board, 15, False)
