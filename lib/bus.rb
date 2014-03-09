class Bus < Vehicle
  def start
    5.times {sleep 1; puts 'Bhram, Bhram, Bhram!'}
    puts 'Started!'
  end
end