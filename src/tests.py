import unittest
import toadsnfrogs

TOAD = 't'
FROG = 'f'
EMPTY = '#'

class TestToadsFrogs(unittest.TestCase):
    def setUp(self):
        self.board = ['t1', 't2', '#', 'f1', 'f2']

    def test_move(self):
        new_board = toadsnfrogs.move(self.board, 1, 1)
        self.assertEqual(new_board, ['t1', '#', 't2', 'f1', 'f2'])

        new_board = toadsnfrogs.move(self.board, 3, -2)
        self.assertEqual(new_board, ['t1', 'f1', 't2', '#', 'f2'])

        new_board = toadsnfrogs.move(self.board, 4, -1)
        self.assertEqual(new_board, ['t1', 'f1', 't2', 'f2', '#'])

        new_board = toadsnfrogs.move(self.board, 2, 2)
        self.assertEqual(new_board, ['t1', 'f1', '#', 'f2', 't2'])

    def test_can_move(self):
        self.assertEqual(1, toadsnfrogs.can_move(self.board, 1))
        self.assertEqual(0, toadsnfrogs.can_move(self.board, 0))
        self.assertEqual(-1, toadsnfrogs.can_move(self.board, 3))
        self.assertEqual(0, toadsnfrogs.can_move(self.board, 4))
        with self.assertRaises(TypeError):
            toadsnfrogs.can_move(self.board, 2)

if __name__ == '__main__':
    unittest.main()
