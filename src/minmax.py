import toadsnfrogs
import tree
import copy
import sys


def minimax(animal_type, node, depth, maximizing_player):
    if depth = 0:
        # do we win here?
        if not node.can_move and node.animal_type != animal_type:
            return 1337
        else:
            return -sys.maxsize

    if maximizing_layer:
        bestValue = -sys.maxsize
        for child in node.alternatives:
            val = minimax(animal_type, child, depth - 1, False)
            bestValue = max(bestValue, val)
        return bestValue
    else:
        bestValue = +sys.maxsize
        for child in node.alternatives:
            val = minimax(animal_type, child, depth - 1, True)
            bestValue = min(bestValue, val)
        return bestValue

# Initial call for maximizing player
root.heuristic_value = minimax(root.animal_type, root, root.get_depth(), True)
