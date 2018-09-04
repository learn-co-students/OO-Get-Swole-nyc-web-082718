class Membership

  attr_accessor :cost, :lifter, :gym

  @@all = []

  def initialize(lifter, gym, cost)
    @cost = cost
    @lifter = lifter
    @gym = gym
    @@all << self
  end

  def self.all
    @@all
  end

end
