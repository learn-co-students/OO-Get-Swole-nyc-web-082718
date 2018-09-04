require 'pry'

class Gym

 @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def memberships
    gym_memberships = []
    Membership.all.each do |memberships|
      if memberships.gym == self
        gym_memberships << memberships
      end
    end
    gym_memberships
  end

  def lifters
    gym_lifters = []
    Membership.all.each do |memberships|
      if memberships.gym == self
        gym_lifters << memberships.lifter
        # binding.pry
      end
    end
    gym_lifters
  end

  def lifter_names
    gym_lifters = []
    Membership.all.each do |memberships|
      if memberships.gym == self
        gym_lifters << memberships.lifter.name
        # binding.pry
      end
    end
    gym_lifters
  end

  def lift_total_for_gym
    gym_lifters = []
    Membership.all.each do |memberships|
      if memberships.gym == self
        gym_lifters << memberships.lifter.lift_total
      end
    end
    # binding.pry
    sum = 0
    gym_lifters.each do |total|
      sum += total
    end
    return sum
  end

end
