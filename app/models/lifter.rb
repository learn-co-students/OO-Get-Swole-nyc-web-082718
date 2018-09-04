
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
    gym_memberships = []
    Membership.all.each do |memberships|
      if memberships.lifter == self
        gym_memberships << memberships
        # binding.pry
      end
    end
    gym_memberships
  end

  def gyms
    gym_memberships = []
    Membership.all.each do |memberships|
      if memberships.lifter == self
        gym_memberships << memberships.gym
        # binding.pry
      end
    end
    gym_memberships
  end

  def self.average_lift
    lifts = []
    self.all.each do |lifter|
      lifts << lifter.lift_total
    end
    sum = 0
    lifts.each do |total|
      sum += total
    end
    return sum/lifts.count
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
    # binding.pry
  end

  def total_cost
    gym_memberships = []
    Membership.all.each do |memberships|
      if memberships.lifter == self
        gym_memberships << memberships.cost
        # binding.pry
      end
    end
    sum = 0
    gym_memberships.each do |total|
      sum += total
    end
    sum
  end

end
