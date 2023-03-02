a=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

a.inject(1) {|count, i| puts "------ #{a[count-4..count-1]}" if count%4==0; count = count + 1}


a.each_slice(4){|s| puts "slice #{s}"}

