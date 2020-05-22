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