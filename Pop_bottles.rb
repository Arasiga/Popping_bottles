require 'pry'
require 'colorize'

class Pop_bottles

  @@bottles_obtained_from_bottle_recycling = []
  @@bottles_obtained_from_cap_recycling = []
  @@bottles_purchased = []
  @@bottles_remaining = []
  @@caps_remaining = []

  def initialize
    @starting_amount = 0
    @bottles = 0
    @caps = 0
    @total = @bottles
    @total_cap_recycled = 0
    @total_bottle_recycled = 0
  end

  def calculate(money)
    @bottles = money/2
    @caps = money/2

    @@bottles_purchased << money/2
    @@bottles_obtained_from_bottle_recycling << @bottles/2
    @@bottles_obtained_from_cap_recycling << @caps/4

    @total = @bottles

    @new_money = ((@bottles/2)*2) + ((@caps/4)*2)

    @bottles = @bottles%2
    @caps = @caps%4


    @bottles = @bottles + @new_money/2
    @caps = @caps + @new_money/2

    @@bottles_remaining << @bottles%2
    @@caps_remaining << @caps%4

    @@bottles_obtained_from_bottle_recycling << (@bottles/2)
    @@bottles_obtained_from_cap_recycling << (@caps/4)

    @total += @new_money/2

    @even_newer_money = ((@bottles/2)*2) + ((@caps/4)*2)

    #binding.pry
    if money < 2
      "Sorry you do not have enough for a bottle"
    else 
      return (@total+(calculate(@even_newer_money)).to_i)
    end

  end

  def print(input)
    @@bottles_obtained_from_bottle_recycling.each do |x|
      @total_bottle_recycled += x
    end

    @@bottles_obtained_from_cap_recycling.each do |x|
      @total_cap_recycled += x
    end

    if input == "bottles"
      "You purchased a total of #{@@bottles_purchased[0]} bottles and were able to retrieve #{@total_bottle_recycled} bottles from recycling your empty bottles!".red
    elsif input == "caps"
      "You purchased a total of #{@@bottles_purchased[0]} bottles and were able to retrieve #{@total_cap_recycled} bottles from recycling your caps!".red
    else
      "I'm sorry I don't know what you want!".red
    end
  end

  def print_remainder
    "after recycling everything, you will have #{@@bottles_remaining[-2]} bottle and #{@@caps_remaining[-2]} cap(s) remaining.".cyan
  end

end

    
puts "How much money would you like to spend?".blue

input = gets.chomp.to_i

test = Pop_bottles.new

puts "With that amount, you will be able to obtain #{test.calculate(input)} bottles in total!".red
puts "-----"

puts "\nEnter 'bottles' if you would like to know how many bottles you were able to obtain through bottle recycling or enter 'caps' if you would like to know how many bottles you obtained through cap recycling.".blue
puts "-----"

input2 = gets.chomp.to_s

puts "------"

if input2 == "bottles" 
  puts test.print(input2)
elsif input2 == "caps"
  puts test.print(input2)
else
  puts "Sorry I do not know what you want!"
end

puts "----"

puts "Furthermore, ".cyan + "#{test.print_remainder}"



























