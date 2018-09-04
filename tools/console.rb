require 'pry'
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

l1 = Lifter.new("Nick", 300)
l2 = Lifter.new("Merlin", 150)
l3 = Lifter.new("Eli", 200)
g1 = Gym.new("Brooklyn Gym")
g2 = Gym.new("Manhattan Gym")
m1 = l1.sign_up(g1, 500)
m2 = l2.sign_up(g1, 500)
m3 = l1.sign_up(g2, 250)
m4 = l3.sign_up(g2, 300)


binding.pry
