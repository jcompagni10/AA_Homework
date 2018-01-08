
require_relative "binary_search_tree"

def kth_largest(tree_node, k)
  bst = BinarySearchTree.new(tree_node)
  sorted = bst.in_order_node_traversal
  sorted[-k]
end
