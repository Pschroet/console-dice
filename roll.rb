#roll a number of dice
diceMuster = /[0-9]+d[0-9]+/							#a number of dice with number of sides
@useExplodingDice = false								#boolean to determine if the highest number triggers further rolls
input = ""

def diceRoll(input)
	number, sides = input.to_s.split(/d/)				#get the number of the dice and the sides
	number = number.to_i								#transform them into integers (either Fixnum or Bignum)
	sides = sides.to_i
	result = 0											#default value for the result so anything generated adds up
	rolls = []											#to remember the rolls
	number.times do										#roll the given times
		temp = rand(sides) + 1							#the throw itself
		rolls.push(temp)								#put the roll in the array
		result += temp									#add it to the result so far
		while(temp == sides && @useExplodingDice)		#if exploding dice is used and the highest number is rolled
			temp = rand(sides) + 1						#the throw itself
			rolls.push(temp)								#put the roll in the array
			result += temp									#add it to the result so far
		end
	end
	puts "You rolled #{number}d#{sides}. Result is #{result} #{rolls}"
end

#check the arguments
for arg in ARGV
	if arg == "-x"
		then @useExplodingDice = true
	elsif(arg.match(/[0-9]+d[0-9]+/))
		if(input != "")
			input = input + "+" + arg
		else
			input = arg
		end
	end
end

#roll the dice
if nil==""
	puts "Missing argument: [number]d[number][ [number]d[number] ...]*"
elsif(input.match(/[0-9]+d[0-9]+([+][0-9]+d[0-9]+)*/))	#if there dices
	dices = input.split("+")
	dices.each{
		|dice|
		diceRoll(dice)
	}
else
	print "#{ARGV} is wrong as argument, usage is [number]d[number][ [number]d[number] ...]*"
end