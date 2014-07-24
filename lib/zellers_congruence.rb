class ZellersCongruence
  # See: http://en.wikipedia.org/wiki/Zeller's_congruence
  # (0 = Saturday, 1 = Sunday, 2 = Monday, ...)
  def self.calculate(month, year)
    q = 1 # day of month
    m = (month <= 2) ? month + 12 : month
    y = (month <= 2) ? year - 1 : year

    p1 = (((m+1) * 26) / 10).floor
    p2 = (y/4).floor
    p3 = 6 * (y/100).floor
    p4 = (y/400).floor
    (q + p1 + y + p2 + p3 + p4) % 7
  end
end
