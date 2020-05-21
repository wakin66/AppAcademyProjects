require 'tdd'

#describe TDD do
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

        it "returns a subarray of the parameter it was passed" do
            arr = [1,1,2,3]
            expect(arr).to include(my_uniq(arr))
        end
    end
#end