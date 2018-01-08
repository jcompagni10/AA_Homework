# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'byebug'
require_relative 'bst_node'

#left = <= daddy
class BinarySearchTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    if @root.nil?
      new_node = create_node(value, nil)
      @root = new_node
      return @root
    end
    cur_node = @root
    next_node = nil
    while cur_node
      next_node = value <= cur_node.value ? "left" : "right"
      if cur_node.send(next_node).nil?
        break
      else
        cur_node = cur_node.send(next_node)
      end
    end
    new_node = create_node(value, cur_node)
    cur_node.send(next_node + "=", new_node)
  end

  def find(value, tree_node = @root)
    return tree_node unless tree_node
    tree_val = tree_node.value
    return tree_node if value == tree_val
    next_tree = value <= tree_val ? tree_node.left : tree_node.right
    find(value, next_tree)
  end

  def delete(value)
    node = find(value)
    return if node.nil?
    if node.left.nil? && node.right.nil?
      if @root == node
        @root = nil
      else
        node.delete
      end
      return
    elsif node.left && node.right
      max = maximum(node.left)
      node.value = max.value
      max.parent.right = max.left
    elsif node.left.nil?
      node.set(node.right)
    else 
      node.set(node.right)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?
    left_depth = depth(tree_node.left) 
    right_depth = depth(tree_node.right)
    [left_depth, right_depth].max + 1
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    (depth(tree_node.left) - depth(tree_node.right) <= 1) && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?
    in_order_traversal(tree_node.left) + [tree_node.value] + in_order_traversal(tree_node.right)
  end

  def in_order_node_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?
    in_order_node_traversal(tree_node.left) + [tree_node] + in_order_node_traversal(tree_node.right)
  end


  private
  def create_node(val, daddy)
    node = BSTNode.new(val)
    node.parent = daddy
    node
  end
  # optional helper methods go here:

end
