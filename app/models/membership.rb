class Membership
  ALL = []

  attr_reader :cost, :lifter, :gym

  def initialize(lifter, gym, cost)
    @cost = cost
    @lifter = lifter
    @gym = gym

    ALL << self

    gym.memberships << self
    gym.lifters << lifter

    lifter.memberships << self
    lifter.gyms << gym
  end

  def self.all
    ALL
  end

end
