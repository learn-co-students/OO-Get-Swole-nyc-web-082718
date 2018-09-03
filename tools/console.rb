require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

bob = Lifter.new("Bob", 700)
tracy = Lifter.new("Tracy", 800)
golds = Gym.new("Golds")
pf = Gym.new("Planet Fitness")
a = Membership.new(bob, golds, 500)
b = Membership.new(tracy, golds, 400)
c = Membership.new(tracy, pf, 700)

binding.pry
0
