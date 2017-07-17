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
    when :fourth
      fourth(weekday)
    when :last
      last(weekday)
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
  
  def fourth(weekday)
    day = third(weekday).day + 1
    while !Date.new(@year, @month, day).send(weekday.to_s + '?')
      day += 1
    end
    Date.new(@year, @month, day)
  end
  
  def last(weekday)
    day = fourth(weekday).day + 1
    begin
    
      while !Date.new(@year, @month, day).send(weekday.to_s + '?')
        day += 1
      end
      rescue
        day = fourth(weekday).day
    end
    Date.new(@year, @month, day)
  end
    
end