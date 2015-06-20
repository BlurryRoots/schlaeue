import unittest
import toadsnfrogs

TOAD = 't'
FROG = 'f'
EMPTY = '#'


class TestToadsFrogs(unittest.TestCase):
    def setUp(self):
        self.board = ['t1', 't2', '#', 'f1', 'f2']

    def test_helper(self):
        self.assertTrue(
            toadsnfrogs.is_empty(['t1', '#', 't2', 'f1', 'f2'], 1))
        self.assertFalse(
            toadsnfrogs.is_empty(['t1', '#', 't2', 'f1', 'f2'], 4)
        )
        self.assertFalse(
            toadsnfrogs.is_in_bounds(['t1', '#', 't2', 'f1', 'f2'], 5)
        )
        self.assertFalse(
            toadsnfrogs.is_in_bounds(['t1', '#', 't2', 'f1', 'f2'], -1)
        )
        self.assertTrue(
            toadsnfrogs.is_in_bounds(['t1', '#', 't2', 'f1', 'f2'], 0)
        )

    def test_swap(self):
        self.assertEqual(
            toadsnfrogs.swap(['t1', 't2', '#', 'f1', 'f2'], 1, 2),
            ['t1', '#', 't2', 'f1', 'f2']
        )

    def test_identity_functions(self):
        self.assertTrue(toadsnfrogs.is_toad(['t1', '#', 't2', 'f1', 'f2'], 0))
        self.assertTrue(toadsnfrogs.is_toad(['t1', 't2', '#', 'f1', 'f2'], 1))
        self.assertFalse(toadsnfrogs.is_toad(['t1', 't2', '#', 'f1', 'f2'], 2))
        self.assertTrue(toadsnfrogs.is_frog(['t1', 't2', '#', 'f1', 'f2'], 3))
        self.assertTrue(toadsnfrogs.is_frog(['t1', 't2', '#', 'f1', 'f2'], 4))
        self.assertFalse(toadsnfrogs.is_frog(['t1', 't2', '#', 'f1', 'f2'], 2))

    def test_enemey(self):
        self.assertFalse(
            toadsnfrogs.is_enemy(['t1', 't2', '#', 'f1', 'f2'], 0, 1)
        )
        self.assertTrue(
            toadsnfrogs.is_enemy(['t1', 't2', 'f1', '#', 'f2'], 1, 2)
        )
        self.assertTrue(
            toadsnfrogs.is_enemy(['t1', 't2', 'f1', '#', 'f2'], 1, 4)
        )

    def test_move(self):
        new_board = toadsnfrogs.move(self.board, 1, 1)
        self.assertEqual(new_board, ['t1', '#', 't2', 'f1', 'f2'])

        new_board = toadsnfrogs.move(self.board, 3, -2)
        self.assertEqual(new_board, ['t1', 'f1', 't2', '#', 'f2'])

        new_board = toadsnfrogs.move(self.board, 4, -1)
        self.assertEqual(new_board, ['t1', 'f1', 't2', 'f2', '#'])

        new_board = toadsnfrogs.move(self.board, 2, 2)
        self.assertEqual(new_board, ['t1', 'f1', '#', 'f2', 't2'])

    def test_can_move_hard(self):
        self.assertEqual(
            toadsnfrogs.can_move(['t1', 't2', '#', 'f1', 'f2'], 3),
            -1
        )
        self.assertEqual(
            toadsnfrogs.can_move(['t1', '#', 't2', 'f1', 'f2'], 2),
            0
        )
        self.assertEqual(
            toadsnfrogs.can_move(['t1', '#', 't2', 'f1', 'f2'], 3),
            -2
        )
        self.assertEqual(
            toadsnfrogs.can_move(['t1', 't2', 'f1', '#', 'f2'], 1),
            2
        )
        self.assertEqual(
            toadsnfrogs.can_move(['f1', '#', 't1', '#'], 0),
            0
        )

    def test_can_move(self):
        self.assertEqual(toadsnfrogs.can_move(self.board, 1), 1)
        self.assertEqual(toadsnfrogs.can_move(self.board, 0), 0)
        self.assertEqual(toadsnfrogs.can_move(self.board, 3), -1)
        self.assertEqual(toadsnfrogs.can_move(self.board, 4), 0)
        with self.assertRaises(TypeError):
            toadsnfrogs.can_move(self.board, 2)

if __name__ == '__main__':
    unittest.main()
