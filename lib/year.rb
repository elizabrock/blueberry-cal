class Year
  YEAR_WIDTH = 63

  def initialize(year)
    @year = year
  end

  def header
    "#{@year}".center(YEAR_WIDTH).rstrip
  end

  def leap_year?
    (@year % 4) == 0 and ((@year % 100) != 0 or (@year % 400) == 0)
  end

  def to_i
    @year.to_i
  end

  def to_s
    output = [ header , "" ]
    months = (1..12).collect do |i|
      month = Month.new(i, @year).to_s.split("\n")
      month[0] = month[0].gsub(/\s+(\w+)( \d{4})/, '\1').center(Month::MONTH_WIDTH)
      month
    end

    months.each_slice(3) do |quarter|
      template = Array.new(Month::MONTH_HEIGHT)
      m1, m2, m3 = quarter
      three_months = template.zip(m1, m2, m3)
      three_months.each{ |line| line.shift } # removes nils from template array
      three_months.each do |line_array|
        justified_lines = line_array.map{|l| l.to_s.ljust(Month::MONTH_WIDTH, " ")}
        output << justified_lines.join("  ")
      end
    end
    output << ""
    output.map{ |line| line.rstrip }.join("\n")
  end
end
