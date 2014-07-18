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
  context "#leap_year?" do
    it "returns false in normal years" do
      year = Year.new(2009)
      year.leap_year?.should be_falsey
    end
    it "returns true for regular leap years" do
      year = Year.new(2008)
      year.leap_year?.should be_truthy
    end
    it "returns false for century (non)leap years" do
      year = Year.new(1900)
      year.leap_year?.should be_falsey
    end
    it "returns true for quad-century leap years" do
      year = Year.new(2000)
      year.leap_year?.should be_truthy
    end
  end
end
