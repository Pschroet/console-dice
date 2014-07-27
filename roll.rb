#roll a number of dice
diceMuster = /[0-9]+d[0-9]+/						#a number of dice with number of sides
input = ARGV[0]										#get the first argument, should be XdY
	if(input.match(diceMuster))						#if it is number + "d" + number
		then
			number, sides = input.to_s.split(/d/)	#get the number of the dice and the sides
			number = number.to_i					#transform them into integers (either Fixnum or Bignum)
			sides = sides.to_i
			result = 0								#default value for the result so anything generated adds up
			rolls = []								#to remember the rolls
			number.times do							#roll the given times
				temp = rand(sides) + 1				#the throw itself
				rolls.push(temp)					#put the roll in the array
				result += temp						#add it to the result so far
			end
			print "You rolled #{number}d#{sides}. Result is #{result} #{rolls}"
		else
			print "#{input} is wrong as argument, usage is [number]d[number]"
	end