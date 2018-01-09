require 'rspec'
require 'bst_practical'

describe 'BST Practical Question' do
  let(:prefilled_bst) do
    bst = BinarySearchTree.new
    [9,8].each do |el|
      bst.insert(el)
    end

    bst
  end

  let(:balanced_bst) do
    bst = BinarySearchTree.new
    [14, 4, 16, 1, 10, 20].each do |el|
      bst.insert(el)
    end

    bst
  end

  it "returns the kth largest node" do
    k = 1
    k_node = prefilled_bst.root.left
    # the above node is pointing to the node with value 2

    expect(kth_largest(prefilled_bst.root, k)).to be(k_node)


    n = 0
    n_node = balanced_bst.root.right
    # the above node is pointing to the node with value 16

    expect(kth_largest(balanced_bst.root, n)).to be(n_node)
  end
end
