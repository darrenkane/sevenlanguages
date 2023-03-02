IO.readlines(ARGV[0]).each_with_index{|line, index| puts "#{index+1}: #{line}" if line =~ /#{ARGV[1]}/i}
