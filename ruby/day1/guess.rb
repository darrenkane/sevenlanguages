STDOUT.sync = true
def guess
  i = rand(10)
  g = -1
  until g == i
    puts "guess a number"
    g = gets.chomp.to_i
    if g == i
      puts 'you are right'
    end
    if g > i
      puts 'too high'
    end
    if g < i
      puts 'too low'
    end
  end
end

guess
