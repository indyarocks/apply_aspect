module Logging

  class Car
    @@entity_class = nil

    def self.register(entity_class)

      return unless @@entity_class.nil?
      @@entity_class = entity_class

      @@entity_class.public_instance_methods(false).each do |m|
        class_eval %{ class  ::#{@@entity_class}
        alias :#{m}_old :#{m}
        remove_method :#{m}

        def #{m}
          t1 = Time.now
          #{m}_old
          t2 = Time.now
          puts "Time #{entity_class.name} #{m} " + (t2-t1).to_s + " secs"
        end
      end}
      end
    end
  end

  class Bus

  end
end