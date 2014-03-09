module AspectBase
  #ASPECT_LOCATION = '/aspects' # relative position from current folder. Find a way to load it in this class

  def has_aspects(*args)
    args.each do |aspect_name|
      apply_aspect(aspect_name)
    end
  end

  def apply_aspect(aspect_name)
    mod = Kernel.const_get(camelize(aspect_name)) rescue nil
    return if mod.nil?

    mod.constants.each do |constant|
      aspect_class = mod.const_get(constant)
      entity_class = Kernel.const_get(constant)
      aspect_class.send(:register, entity_class)
    end

    puts self

    Kernel.const_get("#{camelize(aspect_name)}::#{self.name}") rescue nil
  end

  def camelize(lower_case_and_underscored_word)
    lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
  end
end