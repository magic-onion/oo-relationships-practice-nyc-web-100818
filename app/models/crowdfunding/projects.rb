class Project

  @@all = []

  attr_reader :pledge, :user, :name

  def initialize(name, goal=0)
    @name = name
    @total_pledged = 0
    @users = []
    @goal = goal
  end

  def self.all
    @@all
  end


  def self.no_pledges
    @@all.select {|project| project.total_pledged == 0}
  end

  def self.above_goal
    @@all.select {|project| project.total_pledged > self.goal}
  end

  def self.most_backers
    @@all.max {|a, b| a.user <=> b.user}
  end

  #keeps track of cash pledged to 1 project
  def total_pledged
  end

end
