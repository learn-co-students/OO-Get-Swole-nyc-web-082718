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
    memberships = Membership.all.select do |membership|
      membership.gym == self
    end
    memberships.map do |gym|
      gym.lifter
    end
  end

  def name_of_all_lifters
    memberships = Membership.all.select do |membership|
      membership.gym == self
    end
    memberships.map do |membership|
      membership.lifter
    end
  end

  def lift_total
    total = 0
    Membership.all.each do |membership|
      if membership.gym == self
        total += membership.lifter.lift_total
      end
    end
    total
  end

end

# **Gym**
#
#   - Get a list of all gyms DONE
#
#   - Get a list of all memberships at a specific gym DONE
#
#   - Get a list of all the lifters that have a membership to a specific gym DONE
#
#   - Get a list of the names of all lifters that have a membership to that gym DONE
#
#   - Get the combined lift_total of every lifter has a membership to that gym DONE
