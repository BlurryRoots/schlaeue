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
    human = HumanPlayer(Toad)
    comp = ComputerPlayer(Frog)
    current_player = comp

    print('starting game of frogsntoads')
    print(board)
    while not board.is_game_over(current_player.animal_type.direction):
        board = current_player.next_move(board)
        current_player = human if current_player == comp else comp
        print(board)

    print('game over')
    if current_player is HumanPlayer:
        print('computer wins')
    else:
        print('you win!')
