require_relative 'year'
require_relative 'zellers_congruence'

class Month
  MONTHS = [nil, "January", "February", "March",
                 "April",   "May",      "June",
                 "July",    "August",   "September",
                 "October", "November", "December" ]
  MONTH_WIDTH = 20
  MONTH_HEIGHT = 8
  WEEK_LENGTH = 7
  MONTH_GRID_SIZE = 6 * WEEK_LENGTH
  DAY_WIDTH = 2

  def initialize(month, year)
    @month = month
    @year = Year.new(year)
  end

  def header
    "#{name} #{@year.to_i}".center(MONTH_WIDTH).rstrip
  end

  # See: http://en.wikipedia.org/wiki/Gregorian_calendar#Description
  def length
    length = 30 + ( ( @month + (@month/8).floor ) % 2 )
    if @month == 2
      amount_to_subtract = (@year.leap_year? ? 1 : 2)
      length = length - amount_to_subtract
    end
    length
  end

  def name
    MONTHS[@month]
  end

  def to_s
    output = [header, "Su Mo Tu We Th Fr Sa"]
    days = (1..length).map{ |i| i.to_s.rjust(DAY_WIDTH) + " " }
    padding.times{ days.unshift("   ") }
    until(days.length == MONTH_GRID_SIZE) do
      days << ""
    end
    days.each_slice(WEEK_LENGTH){|line| output << line.join("").rstrip }
    output.join("\n") + "\n"
  end

  private

  def padding
    zellers = ZellersCongruence.calculate(@month, @year.to_i)
    (zellers + 6 ) % 7
  end
end
