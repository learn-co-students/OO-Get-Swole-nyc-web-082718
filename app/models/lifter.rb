require 'pry'

class Lifter
  attr_accessor :name, :lift_total

  @@all = []

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
    memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift
    all.inject(0) do |sum, lifter|
      sum + lifter.lift_total
    end / all.length
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end
  # total_cost
  #   returns a sum of the total cost of lifter's gym memberships (FAILED - 5)
  def total_cost
    memberships.inject(0) do |sum, membership|
      sum + membership.cost
    end
  end
end
