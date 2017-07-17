require 'pry'
require 'date'
class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, eenth)
    case eenth
    when :teenth
      day = 13
      while !Date.new(@year, @month, day).send(weekday.to_s + '?')
        day += 1
      end
      Date.new(@year, @month, day)
    when :first
      day = 1
      while !Date.new(@year, @month, day).send(weekday.to_s + '?')
        day += 1
      end
      Date.new(@year, @month, day)
    when :second
      second(weekday)
    when :third
      third(weekday)
      # day = 1
      # while !Date.new(@year, @month, day).send(weekday.to_s + '?')
      #   day += 1
      # end
      # Date.new(@year, @month, day)
      # Date.new(2013, 3, 11)
    end
    
  end
  
  def first(weekday)
    day = 1
    while !Date.new(@year, @month, day).send(weekday.to_s + '?')
      day += 1
    end
    Date.new(@year, @month, day)
  end
  
  def second(weekday)
    day = first(weekday).day + 1
    while !Date.new(@year, @month, day).send(weekday.to_s + '?')
      day += 1
    end
    Date.new(@year, @month, day)
  end
  
  def third(weekday)
    day = second(weekday).day + 1
    while !Date.new(@year, @month, day).send(weekday.to_s + '?')
      day += 1
    end
    Date.new(@year, @month, day)
  end
    
    
end
  # def test_first_monday_of_march_2013
    
  #   assert_equal Date.new(2013, 3, 4),
  #     Meetup.new(3, 2013).day(:monday, :first)
  # end