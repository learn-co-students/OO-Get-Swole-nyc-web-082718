require "pry"

class Lifter

  attr_reader :name, :lift_total

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
    gyms_list = []
      Membership.all.each do |membership|
        if membership.lifter == self
          gyms_list << membership.gym
        end
    end
    gyms_list
  end

  def self.average_lift
    total = 0
    self.all.each do |lifts|
      total += lifts.lift_total
    end
    total/self.all.length
  end

  def total_cost
    total = 0
    Membership.all.each do |memberships|
      if memberships.lifter == self
      total += memberships.cost
      end
    end
    total
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

end
