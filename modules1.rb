 module CircusPerformer
  def juggle
    puts "I'm a juggler!"
  end
end

class Dog < Animal
  include CircusPerformer 
end

#must define Animal for it to work

Dog.new.juggle