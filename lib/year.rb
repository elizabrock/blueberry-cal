class Year
  def initialize(year)
    @year = year
  end

  def leap_year?
    (@year % 4) == 0 and ((@year % 100) != 0 or (@year % 400) == 0)
  end

  def to_i
    @year.to_i
  end

  def to_s
    @year.to_s
  end
end
