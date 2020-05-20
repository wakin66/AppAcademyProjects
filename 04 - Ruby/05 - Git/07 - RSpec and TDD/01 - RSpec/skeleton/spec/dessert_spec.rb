require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef Mark the Great Baker", :bake => "") }
  subject(:dessert) { Dessert.new("brownie",50,chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq(Array.new)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        new_dessert = Dessert.new("brownie","many",chef)
      end.to raise_exception(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("mix")
      
      expect(dessert.ingredients).to include("mix")
    end
  end

  describe "#mix!" do
    before(:example) do
      dessert.add_ingredient("mix")
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("milk")
      dessert.add_ingredient("sugar")
    end
    it "shuffles the ingredient array" do
      ingredients = ["mix","eggs","milk","sugar"]
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ingredients)
      expect(dessert.ingredients).to match_array(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(5)).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        dessert.eat(500)
      end.to raise_exception("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Chef Mark the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      dessert.make_more
      expect(chef).to have_received(:bake).with(dessert)
    end
  end
end
