class Membership

  attr_reader :lifter, :gym, :cost

  @@all = []

  def initialize(lifter, gym, cost)
    @gym = gym
    @lifter = lifter
    @cost = cost
    @@all << self
  end

  def self.all
    @@all
  end



end
