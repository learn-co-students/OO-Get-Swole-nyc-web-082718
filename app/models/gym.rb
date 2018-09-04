class Gym

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters
    self.memberships.map do |membership|
      membership.lifter
    end
  end

  def lifter_names
    self.lifters.map do |lifter_obj|
      lifter_obj.name
    end
  end

  def lift_total_for_gym
    lift_totals = lifters.map do |lifter_obj|
      lifter_obj.lift_total
    end
    lift_totals.inject(0) do |sum, x|
      sum + x
    end
  end

end
