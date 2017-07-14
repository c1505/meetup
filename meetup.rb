require 'pry'
require 'date'
class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, eenth)
    day = 13
    while !Date.new(@year, @month, day).send(weekday.to_s + '?')
      day += 1
    end
    Date.new(@year, @month, day)
  end
end
