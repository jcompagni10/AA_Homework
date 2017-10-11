require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("Chef") }
  subject {Dessert.new("cake", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("cake")
    end


    it "sets a quantity" do
      expect(subject.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to  be_empty
    end


    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake", "100", "joe")}.to raise_error(ArgumentError)

    end
  end

  describe "#add_ingredient" do
    before(:each) {subject.add_ingredient("flour")}
    it "adds an ingredient to the ingredients array" do
      expect(subject.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    before(:each) {subject.add_ingredient("flour")}
    before(:each) {subject.add_ingredient("eggs")}
    before(:each) {subject.add_ingredient("milk")}
    # before(:each) {subject.mix!}
    it "shuffles the ingredient array" do
      subject.mix!
      expect(subject.ingredients).not_to eq(%W[flour eggs milk])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      subject.eat(10)
      expect(subject.quantity).to eq(90)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {subject.eat(9999999)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Julian The Swaggiest Baker")
      expect(subject.serve).to include("Chef Julian The Swaggiest Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      subject.make_more
    end
  end
end
