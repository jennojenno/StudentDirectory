# Add attributes that you want to know about your classmates (don't be nosy...)
# Finish the implementation so that you ask for all the attributes in your classes and save them in attr_accessors.
# Refactor this code so that we can create a Student or an Instructor, based on the users imput (a bit like the Factory pattern we saw earlier...).
# Make any other improvements you see fit
# Go around the class and ask your classmates to complete the information provided
# Check that you have a student_directory.yml file in your project folder.


require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :hometown
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact

  def self.create_person(type)
    case type
    when "Instructor"
      Instructor.new
    when "Student"
      Student.new
    else nil
    end

  end
end

class Student < Person
  attr_accessor :reason_for_joining
end

class Instructor < Person
  attr_accessor :type
end

@directory = ""
puts "Student Directory, v0.0.2 by Jen Lim"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do

  person = nil
  case input

  when input != ('student'.downcase || 'instructor'.downcase)
    print "Please enter student or instructor."
  end

    person = Person.new
    print "What is your name? "
    person.name = gets.strip.chomp
    print "What is your email? "
    person.email = gets.strip.chomp
    while not person.email.include?("@")
      print "You need to enter an email with a '@'! "
      person.email = gets.strip.chomp
    end
    print "Where are you from? "
    person.hometown = gets.strip.chomp
    print "What's your GitHub username? "
    person.github_user = gets.strip.chomp
    print "Tell me a fun fact about yourself! "
    person.fun_fact = gets.strip.chomp 

    when 'student'
    person = Student.new
    print "What made you join WDI at GA? "
    person.reason_for_joining = gets.strip.chomp
  end

    when 'instructor'
    person = Instructor.new
    print "What sort of instructor are you? "
    person.type = gets.strip.chomp

  end
  
  # Append this to our yaml file
  @directory += person.to_yaml
  puts @directory
  
  print "Student or instructor?, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
