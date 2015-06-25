import unittest
from toadsnfrogs import Frog, Toad, Space, Board


class TestToadsFrogs(unittest.TestCase):
    def setUp(self):
        pass

    def test_move(self):
        t1 = Toad(1)
        t2 = Toad(2)
        f1 = Frog(1)
        f2 = Frog(2)
        space = Space()

        board = Board([t1, t2, space, f1, f2])

        new_board = board.move(1, 1)
        self.assertEqual(new_board, Board([t1, space, t2, f1, f2]))

        new_board = new_board.move(3, -2)
        self.assertEqual(new_board, Board([t1, f1, t2, space, f2]))

        new_board = new_board.move(4, -1)
        self.assertEqual(new_board, Board([t1, f1, t2, f2, space]))

        new_board = new_board.move(2, 2)
        self.assertEqual(new_board, Board([t1, f1, space, f2, t2]))

    def test_cant_move(self):
        t1 = Toad(1)
        t2 = Toad(2)
        f1 = Frog(1)
        f2 = Frog(2)
        space = Space()

        board = Board([t1, t2, space, f1, f2])
        self.assertEqual(1, board.can_move(1))
        self.assertEqual(-1, board.can_move(3))
        self.assertEqual(0, board.can_move(4))
        self.assertEqual(0, board.can_move(2))

    def test_can_move_one_step(self):
        t1 = Toad(1)
        t2 = Toad(2)
        f1 = Frog(1)
        f2 = Frog(2)
        space = Space()

        board = Board([t1, t2, space, f1, f2])

        self.assertEqual(1, board.can_move(1))
        self.assertEqual(-1, board.can_move(3))

    def test_can_move_two_steps(self):
        t1 = Toad(1)
        t2 = Toad(2)
        f1 = Frog(1)
        f2 = Frog(2)
        space = Space()

        board = Board([t1, space, t2, f1, space, f2])
        self.assertEqual(2, board.can_move(2))
        self.assertEqual(-2, board.can_move(3))

    def test_possible_moves(self):
        t1 = Toad(1)
        t2 = Toad(2)
        f1 = Frog(1)
        f2 = Frog(2)
        space = Space()

        board = Board([t1, t2, space, f1, f2])
        self.assertEqual(board.get_possible_moves(1), [1])
        self.assertEqual(board.get_possible_moves(-1), [3])

        board = Board([t1, t2, f1, space, f2])
        self.assertEqual(board.get_possible_moves(-1), [4])

        board = Board([t1, space, t2, f1, space, f2])
        self.assertEqual(board.get_possible_moves(1), [0, 2])

if __name__ == '__main__':
    unittest.main()
