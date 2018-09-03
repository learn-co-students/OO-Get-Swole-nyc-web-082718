class Gym
 @@all = []

  attr_reader :name

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
    Membership.all.map do |membership|
      if membership.gym == self
        membership.lifter
      end
    end
  end

  def lifter_names
    member_names = []
    Membership.all.each do |membership|
      if membership.gym == self
        member_names << membership.lifter.name
      end
    end
    member_names
  end

  def lift_total_for_gym
    total = 0
    Membership.all.each do |membership|
      if membership.gym == self
        total += membership.lifter.lift_total
      end
    end
    total
  end


end
