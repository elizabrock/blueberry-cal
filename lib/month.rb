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
    unless (1..12).include? month
      raise ArgumentError, "cal: #{month} is not a month number (1..12)"
    end
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
    days = (1..MONTH_GRID_SIZE).map{ |n| (1..length).include?(n - padding) ? (n - padding).to_s : "" }
    days = days.map{|day| day.rjust(DAY_WIDTH) }
    days.each_slice(WEEK_LENGTH){|line| output << line.join(" ").rstrip }
    output.inject(""){|memo, line| memo + line + "\n" }
  end

  private

  def padding
    zellers = ZellersCongruence.calculate(@month, @year.to_i)
    (zellers + 6 ) % 7
  end
end
