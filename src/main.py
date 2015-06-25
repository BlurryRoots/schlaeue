from toadsnfrogs import *


if __name__ == '__main__':
    t1 = Toad(1)
    t2 = Toad(2)
    t3 = Toad(3)
    f1 = Frog(1)
    f2 = Frog(2)
    f3 = Frog(3)
    space = Space()
    board = Board([t1, t2, t3, space, space, space, space, f1, f2, f3])
    player = -1  # computer starts

    print('starting game of frogsntoads')
    print(board)
    while not board.is_game_over(player):
        board = next_move(board, player)
        player = -player
        print(board)

    print('game over')
    if player == 1:
        print('computer wins')
    elif player == -1:
        print('you win!')
