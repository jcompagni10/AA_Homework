class BSTNode
  attr_accessor :value, :left, :right, :parent
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end

  def delete
    if value <= @parent.value
      @parent.left = nil
    else
      @parent.right = nil
    end
  end

  def set(node)
    self.value = node.value
    self.left = node.left
    self.right = node.right
  end
end
