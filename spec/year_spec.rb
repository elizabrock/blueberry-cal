require_relative '../lib/year'

RSpec.describe Year do
  context "#to_i" do
    it "returns the year as an integer" do
      year = Year.new(2001.0)
      year.to_i.should == 2001
    end
  end
  context "#to_s" do
    it "returns the year as a string" do
      year = Year.new(2001)
      year.to_s.should == "2001"
    end
  end
end
