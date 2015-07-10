require_relative '../lib/enumerable_methods'

describe Enumerable do

  before :each do
    @test = [1,2,3,4]
    @into = []
  end

  describe '#my_each' do
    it "runs passed block on each iteration" do
      expect(@test.my_each { |i| @into << i }).to satisfy {@into == [1,2,3,4]}
    end
  end

  describe '#my_each_with_index' do
    it "runs passed block on each iteraction, with an index" do
      indices = []
      expect(@test.my_each_with_index {|num, index| @into << num ; indices << index}).to satisfy {@into == [1,2,3,4] ; indices == [0,1,2,3]}
    end
  end

  describe '#my_select' do
    it "return array of items that passed select" do
      expect(@test.my_select { |i| i > 2}).to eq([3,4])
    end
  end

  describe '#my_all?' do
    it "return true when block conditional is true for all" do
      expect(@test.my_all? {|i| i > -1}).to eq(true)
      expect(@test.my_all? {|i| i > 99}).to eq(false)
    end
  end

  describe '#my_none?' do
    it "return true when block conditional is false for all" do
      expect(@test.my_none? {|i| i < -1}).to eq(true)
      expect(@test.my_none? {|i| i > 1}).to eq(false)
    end
  end

  describe '#my_map' do
    it "returns array with results of operation in passed block" do
      expect(@test.my_map {|i| i * 5}).to eq([nil, 5,10,15,20])
    end
  end

  describe '#my_inject' do
    it "returns result of operation in block with it return value being the argument for the next iteration" do
      expect(@test.my_inject {|i, total| i + total}).to eq(10)
    end
  end
end
