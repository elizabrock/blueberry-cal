require_relative '../lib/month'

RSpec.describe Month do
  context "#header" do
    it "matches cal for December 2012" do
      month = Month.new(12, 2012)
      month.header.should == "   December 2012"
    end
    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901"
    end
  end
  context "#length" do
    it "correctly tabulates January" do
      Month.new(1, 2012).length.should == 31
    end
    it "correctly tabulates February in a leap year" do
      Month.new(2, 2009).length.should == 28
    end
    it "correctly tabulates February in a regular year" do
      Month.new(2, 2012).length.should == 29
    end
    it "correctly tabulates March" do
      Month.new(3, 2012).length.should == 31
    end
    it "correctly tabulates April" do
      Month.new(4, 2012).length.should == 30
    end
    it "correctly tabulates May" do
      Month.new(5, 2012).length.should == 31
    end
    it "correctly tabulates June" do
      Month.new(6, 2012).length.should == 30
    end
    it "correctly tabulates July" do
      Month.new(7, 2012).length.should == 31
    end
    it "correctly tabulates August" do
      Month.new(8, 2012).length.should == 31
    end
    it "correctly tabulates September" do
      Month.new(9, 2012).length.should == 30
    end
    it "correctly tabulates October" do
      Month.new(10, 2012).length.should == 31
    end
    it "correctly tabulates November" do
      Month.new(11, 2012).length.should == 30
    end
    it "correctly tabulates December" do
      Month.new(12, 2012).length.should == 31
    end
  end
  context "#name" do
    it "translates January" do
      Month.new(1, 2012).name.should == "January"
    end
    it "translates February" do
      Month.new(2, 2012).name.should == "February"
    end
    it "translates March" do
      Month.new(3, 2012).name.should == "March"
    end
    it "translates April" do
      Month.new(4, 2012).name.should == "April"
    end
    it "translates May" do
      Month.new(5, 2012).name.should == "May"
    end
    it "translates June" do
      Month.new(6, 2012).name.should == "June"
    end
    it "translates July" do
      Month.new(7, 2012).name.should == "July"
    end
    it "translates August" do
      Month.new(8, 2012).name.should == "August"
    end
    it "translates September" do
      Month.new(9, 2012).name.should == "September"
    end
    it "translates October" do
      Month.new(10, 2012).name.should == "October"
    end
    it "translates November" do
      Month.new(11, 2012).name.should == "November"
    end
    it "translates December" do
      Month.new(12, 2012).name.should == "December"
    end
  end
end
