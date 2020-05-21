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