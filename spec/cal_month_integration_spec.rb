RSpec.describe "Cal's full month integration" do
  context "Error Cases" do
    context "incorrect usage" do
      it "prints a usage message for no arguments" do
        expected = "usage: cal [month] year\n"
        actual = `./cal`
        actual.should == expected
      end
      it "prints a usage message for full dates" do
        expected = "usage: cal [month] year\n"
        actual = `./cal 12 24 2016`
        actual.should == expected
      end
    end
    context "incorrect month number" do
      it "prints an error message for month 0" do
        expected = "cal: 0 is not a month number (1..12)\n"
        actual = `./cal 0 2016`
        actual.should == expected
      end
      it "prints an error message for month 16" do
        expected = "cal: 16 is not a month number (1..12)\n"
        actual = `./cal 16 2016`
        actual.should == expected
      end
    end
    context "incorrect year number" do
      it "prints an error message for small years" do
        expected = "cal: year 1799 not in range 1800..3000\n"
        actual = `./cal 12 1799`
        actual.should == expected
      end
      it "prints an error message for large years" do
        expected = "cal: year 3001 not in range 1800..3000\n"
        actual = `./cal 12 3001`
        actual.should == expected
      end
    end
  end
  context "Edge Cases" do
    it "should print a month that is only 4 weeks long" do
      expected = <<EOS
   February 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28


EOS
      actual = `./cal 02 2015`
      actual.should == expected
    end

    it "should print a month that is 6 weeks long" do
      expected = <<EOS
    January 2016
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
      actual = `./cal 01 2016`
      actual.should == expected
    end

    it "should print a month that starts on Saturday" do
      expected = <<EOS
     July 2017
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
      actual = `./cal 07 2017`
      actual.should == expected
    end

    it "should print a month that starts on Sunday" do
      expected = <<EOS
    January 2017
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
      actual = `./cal 01 2017`
      actual.should == expected
    end

    it "should print February in quad century leap years" do
      expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
      actual = `./cal 02 2000`
      actual.should == expected
    end

    it "should print February in century non-leap years" do
      expected = <<EOS
   February 1900
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28

EOS
      actual = `./cal 02 1900`
      actual.should == expected
    end
  end

  context "Base Cases" do
    it "should correctly print a standard 5 week month" do
      expected = <<EOS
   December 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
      actual = `./cal 12 2013`
      actual.should == expected
    end

    it "should print a month that begins in the middle of a week" do
      expected = <<EOS
    August 2013
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS
      actual = `./cal 08 2013`
      actual.should == expected
    end

    it "should print 30 day months" do
      expected = <<EOS
   September 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30

EOS
      actual = `./cal 09 2013`
      actual.should == expected
    end

    it "should print 31 day months" do
      expected = <<EOS
   December 2012
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
      actual = `./cal 12 2012`
      actual.should == expected
    end

    it "should print 28 day months" do
      expected = <<EOS
   February 2003
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS
      actual = `./cal 02 2003`
      actual.should == expected
    end

    it "should print 29 day months" do
      expected = <<EOS
   February 2008
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29

EOS
      actual = `./cal 02 2008`
      actual.should == expected
    end
  end
end
