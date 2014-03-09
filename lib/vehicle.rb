class Vehicle
  extend AspectBase
  has_aspects :logging, :notification

  def start
  end

end