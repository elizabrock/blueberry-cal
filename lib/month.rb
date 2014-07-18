require_relative 'year'
require_relative 'zellers_congruence'

class Month
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  MONTH_WIDTH = 20
  MONTH_GRID_SIZE = 6 * 7
  WEEK_LENGTH = 7
  DAY_WIDTH = 2

  def initialize(month, year)
    @month = month
    @year = Year.new(year)
  end

  def header
    "#{name} #{@year.to_i}".center(MONTH_WIDTH).rstrip
  end

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
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    full_month = Array.new(length){ |index| index + 1 }
    padding.times{ full_month.unshift(nil) }
    until(full_month.length == MONTH_GRID_SIZE) do
      full_month << nil
    end

    full_month.each_slice(WEEK_LENGTH) do |week|
      days = week.map{ |day| day.to_s.rjust(DAY_WIDTH) }
      output << days.join(" ").rstrip
      output << "\n"
    end
    output
  end

  private

  def padding
    zellers = ZellersCongruence.calculate(@month, @year.to_i)
    (zellers + 6 ) % 7
  end
end
