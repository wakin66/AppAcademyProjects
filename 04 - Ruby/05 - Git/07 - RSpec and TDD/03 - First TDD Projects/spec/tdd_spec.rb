require 'tdd'

describe "#my_uniq" do
    it "doesn't raise an error when passed an array" do
        expect {my_uniq([1,2,3])}.to_not raise_exception
    end

    it "raises an error if passed something other than an array" do
        expect {my_uniq("not_array")}.to raise_exception(ArgumentError)
    end

    it "returns an array with no duplicates" do
        expect(my_uniq([1,1,2,3])).to eq([1,2,3])
    end
end

describe Array do
    describe "#two_sum" do
        it "returns an array" do
            expect([-1, 0, 2, -2, 1].two_sum).to be_an(Array)
        end

        it "returns an array of pairs (2-D array)" do
            expect([-1, 0, 2, -2, 1].two_sum.first).to be_an(Array)
        end

        it "returns pairs of indecies whose value sum to zero" do
            arr = [-1, 0, 2, -2, 1]
            pair = arr.two_sum.first
            expect(arr[pair.first]+arr[pair.last]).to eq(0)
        end

        context "is sorted dictionary-wise" do
            it "smaller first elements come first" do
                arr = [-2,1,2,-1]
                pairs = arr.two_sum
                expect(pairs.first.first).to be < pairs.last.first
            end
            it "smaller second elements come first" do
                arr = [1,-1,0,-1]
                pairs = arr.two_sum
                expect(pairs.first.last).to be < pairs.last.last
            end
        end
    end
end

describe "#my_transpose" do
    it "takes a 2-D array as an argument" do
        expect {my_transpose([
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ])}.to_not raise_exception
    end

    it "returns a 2-D array" do
        expect(my_transpose([
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]).first).to be_an(Array)
    end

    it "returns a transposed 2-D array" do
        expect(my_transpose([
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ])).to eq([[0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]]
        )
    end
end

describe "#stock_picker" do
    let (:prices) {[35, 26, 29, 46, 14, 11, 13, 42, 31, 31]}
    it "takes an array as an argument" do
        expect {stock_picker(prices)}.to_not raise_exception
    end

    it "raises an error if passed anything but an array" do
        expect {stock_picker("prices")}.to raise_exception(ArgumentError)
    end

    it "returns an array" do
        expect(stock_picker(prices)).to be_an(Array)
    end

    it "returns an array of length 2" do
        expect(stock_picker(prices).length).to eq(2)
    end

    it "returns an array whose first element is less than its last element" do
        pair = stock_picker(prices)
        expect(pair.first).to be < pair.last
    end

    it "returns the most profitable pair of days" do
        expect(stock_picker(prices)).to eq([5,7])
    end
end

describe Hanoi do
    let(:game) {Hanoi.new}

    describe "#initialize" do
        it "creates @pegs as an array" do
            expect(game.pegs).to be_an(Array)
        end

        it "adds 4 pegs to the first peg" do
            expect(game.pegs.first.length).to eq(4)
        end

        it "lists the pegs in ascending order" do
            expect(game.pegs.first).to eq([1,2,3,4])
        end
    end

    describe "#valid_pos?" do
        it "returns true if given a valid position" do
            expect(game.valid_pos?(1)).to eq(true)
        end

        it "returns false if given an invvalid position" do
            expect(game.valid_pos?(5)).to eq(false)
        end
    end

    describe "#valid_move?" do
        it "returns true if given a valid move" do
            expect(game.valid_move?(0,1)).to eq(true)
        end

        it "returns false if given an invalid move" do
            expect(game.valid_move?(2,1)).to eq(false)
        end
    end

    describe "#get_top_ring" do
        it "takes an array as an argument" do
            expect {game.get_top_ring(game.pegs.first)}.to_not raise_exception
        end

        it "returns an array" do
            expect(game.get_top_ring(game.pegs.first)).to be_an(Array)
        end

        it "returns the first ring on a peg" do
            expect(game.get_top_ring(game.pegs.first)).to eq([0,1])
        end
    end

    context "on a new game" do
        describe "render" do
            it "doesn't raise an exception" do
                expect {game.render}.to_not raise_exception
            end
        end

        describe "#game_over?" do
            it "returns false" do
                expect(game.game_over?).to eq(false)
            end
        end

        describe "@pegs" do
            it "has a length of 4 for the first peg" do
                expect(game.pegs.first.length).to eq(4)
            end

            it "has a length of 0 for the second peg" do
                expect(game.pegs[1].length).to eq(0)
            end

            it "has a length of 0 for the thrid peg" do
                expect(game.pegs.last.length).to eq(0)
            end
        end
    end

    context "on game over" do
        before(:each) do
            game.make_move(0,1)
            game.make_move(0,2)
            game.make_move(1,2)
            game.make_move(0,1)
            game.make_move(2,0)
            game.make_move(2,1)
            game.make_move(0,1)
            game.make_move(0,2)
            game.make_move(1,2)
            game.make_move(1,0)
            game.make_move(2,0)
            game.make_move(1,2)
            game.make_move(0,1)
            game.make_move(0,2)
            game.make_move(1,2)
        end

        describe "#game_over?" do
            it "returns true" do
                expect(game.game_over?).to eq(true)
            end
        end

        describe "@pegs" do
            it "has a length of 0 for the first peg" do
                expect(game.pegs.first.length).to eq(0)
            end

            it "has a length of 0 for the second peg" do
                expect(game.pegs[1].length).to eq(0)
            end
            
            it "has a length of 4 for the thrid peg" do
                expect(game.pegs.last.length).to eq(4)
            end
        end
    end
end