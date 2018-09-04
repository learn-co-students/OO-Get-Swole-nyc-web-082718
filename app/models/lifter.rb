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
    self.memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift
    lift_array = self.all.map do |lifter|
      lifter.lift_total
    end
    lift_array.inject do |sum, x|
      sum + x
    end.to_f / lift_array.size
  end

  def sign_up(gym, cost)
    Membership.new(self, gym, cost)
  end

  def total_cost
    cost_array = memberships.map do |membership|
      membership.cost
    end
    cost_array.inject(0) do |sum, x|
      sum + x
    end
  end

end
