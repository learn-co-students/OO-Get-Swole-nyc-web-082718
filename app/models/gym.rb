class Gym
 ALL = []

  attr_reader :name, :memberships, :lifters

  def initialize(name)
    @name = name
    @memberships = []
    @lifters = []

    ALL << self
  end

  def self.all
    ALL
  end

  def lifter_names
    @lifters.map { |l| l.name }
  end

  def lift_total_for_gym
    @lifters.map { |l| l.lift_total }.inject(:+)
  end

end
