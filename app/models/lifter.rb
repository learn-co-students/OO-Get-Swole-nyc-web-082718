class Lifter
  ALL = []

  attr_reader :name, :lift_total, :memberships, :gyms

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @memberships = []
    @gyms = []

    ALL << self
  end

  def self.all
    ALL
  end

  def self.average_lift
    ALL.map { |l| l.lift_total }.inject(:+) / ALL.count
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    @memberships.map { |m| m.cost }.inject(:+)
  end

end
