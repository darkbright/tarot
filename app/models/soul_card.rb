require 'date'

MajorArcanaCard = ["The Fool", "The magician", "The High Priestess", 	# 0 1 2
	"The Empress", "The Emperor", "The Hierophant", 				# 3 4 5
	"The Lover", "The Chariot", "Strength", 						# 6 7 8
	"The Hermit", "Wheel of Fortune", "Justice", 					# 9 10 11
	"The Hanged Man", "Death", "Temperance", 						# 12 13 14
	"The Devil", "The Tower", "The Star", 						# 15 16 17
	"The Moon", "The Sun", "Judgement", "The World"]				# 18 19 20 21
MajorArcanaPremise = ["beginnings", "active", "great balance", 
	"nature and sensation", "structure and authority", "belief system", 
	"relationship", "vigorous ego", "strength", 
	"needfinder", "turning point", "wipe the slate clean", 
	"turned upside down", "transision", "balancing", 
	"ignorance and hopelessness", "sudden change", "hope and inspiration", 
	"lost and bewildered", "enlighten", "reborn and calling", "new level"]


class MajorArcana
  attr_accessor :number, :card, :premise

  def initialize(no = 0)
    @number = no
  end

#  def number
#    @number
#  end

  def card
    MajorArcanaCard[@number]
  end

  def premise
    MajorArcanaPremise[@number]
  end
end # end of class MajorArcana

class SoulCard
  attr_accessor :date, :soul, :moon, :year

  def initialize(date = Date.new(1972, 7, 26))
    @date = date
    @soul = MajorArcana.new(soulnumber)
    @moon = MajorArcana.new(moonnumber)
    @year = MajorArcana.new
  end

  def soulnumber
    year = @date.year.to_s
    sum = year[0].to_i + year[1].to_i + year[2].to_i + year[3].to_i

    sum += self.moonnumber

    sum = sum/10 + sum%10 if sum > 9
    sum = sum              unless sum > 9

    sum
  end

  def moonnumber
    month = "%2d" % [@date.mon]
    day = "%2d" % [@date.mday]
    sum = month[0].to_i + month[1].to_i + day[0].to_i + day[1].to_i


    sum = sum/10 + sum%10 if sum > 22
    sum = 0                if sum == 22
    sum = sum              if sum < 22

    sum
  end

  def yearnumber(no)
    y = no.to_s
    sum = y[0].to_i + y[1].to_i + y[2].to_i + y[3].to_i
    sum += self.moonnumber
    if sum > 21
      sum = sum / 10 + sum % 10
    end

    @year.number = sum

    sum

  end

end

jang = SoulCard.new(Date.new(1980, 2, 19))
puts jang.date
jang.yearnumber(2014)
puts "Soul Sign : %2d %s (%s)" % [jang.soul.number, jang.soul.card, jang.soul.premise]

puts "Moon Sign : %2d %s (%s)" % [jang.moon.number, jang.moon.card, jang.moon.premise]
(1980..2014).each do |y|
  jang.yearnumber(y)
  puts "%d Year Card : %2d %s (%s)" % [y, jang.year.number, jang.year.card, jang.year.premise]
end


kim = SoulCard.new(Date.new(1972, 7, 26))
puts kim.date
kim.yearnumber(2014)
puts "Soul Sign : %2d %s (%s)" % [kim.soul.number, kim.soul.card, kim.soul.premise]
puts "Moon Sign : %2d %s (%s)" % [kim.moon.number, kim.moon.card, kim.moon.premise]
puts "Year Card : %2d %s (%s)" % [kim.year.number, kim.year.card, kim.year.premise]

(1980..2014).each do |y|
  kim.yearnumber(y)
  puts "%d Year Card : %2d %s (%s)" % [y, kim.year.number, kim.year.card, kim.year.premise]
end
