require './vehicle.rb'

class Car < Vehicle

  def start
    3.times {sleep 1; puts 'Broom, Broom, Broom!'}
    puts 'Started!'
  end

end