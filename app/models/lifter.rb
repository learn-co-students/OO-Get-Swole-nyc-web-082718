
class Lifter

  @@all = []

  attr_reader :lift_total
  attr_writer :name

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms
    memberships = Membership.all.select do |membership|
      membership.lifter == self
    end
    memberships.map do |lifter|
      lifter.gym
    end
  end

  def self.average_lift
    total = 0
    self.all.each do |lifter|
      total += lifter.lift_total
    end
    total/self.all.length
  end

  def total_cost
    total = 0
    Membership.all.each do |membership|
      if membership.lifter == self
      total += membership.cost
      end
    end
    total
  end

  def new_gym(gym, cost)
    Membership.new(self, gym, cost)
  end

end

# **Lifter**
#
#   - Get a list of all lifters DONE
#
#   - Get a list of all the memberships that a specific lifter has DONE
#
#   - Get a list of all the gyms that a specific lifter has memberships to DONE
#
#   - Get the average lift total of all lifters DONE
#
#   - Get the total cost of a specific lifters gym memberships DONE
#
#   - Given a gym and a membership cost, sign a specific lifter up for a new gym DONE
