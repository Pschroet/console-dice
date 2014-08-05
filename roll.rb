#roll a number of dice
diceMuster = /[0-9]+d[0-9]+/						#a number of dice with number of sides

def diceRoll(input)
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
	puts "You rolled #{number}d#{sides}. Result is #{result} #{rolls}"
end

input = ARGV[0]										#get the first argument, should be XdY
if nil==input
	puts "Missing argument: [number]d[number][+[number]d[number]]*"
elsif(input.match(/[0-9]+d[0-9]+([+][0-9]+d[0-9]+)*/))	#if there dices
	dices = input.to_s.split("+")
	dices.each{
		|dice|
		diceRoll(dice)
	}
else
	print "#{input} is wrong as argument, usage is [number]d[number][+[number]d[number]]*"
end