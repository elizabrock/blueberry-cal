require_relative 'year'
require_relative 'zellers_congruence'

class Month
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  WEEK_LENGTH = 7
  DAY_WIDTH = 2

  def initialize(month, year)
    @month = month
    @year = Year.new(year)
  end

  def header
    "#{name} #{@year}".center(20).rstrip
  end

  def name
    MONTHS[@month]
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    month_length = 31
    full_month = Array.new(month_length){ |index| index + 1 }
    padding.times{ full_month.unshift(nil) }

    full_month.each_slice(WEEK_LENGTH) do |week|
      days = week.map{ |day| day.to_s.rjust(DAY_WIDTH) }
      output << days.join(" ")
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
