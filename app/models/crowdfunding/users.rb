class User

  attr_reader :project, :pledge, :name, :pledges

  @@all = []

  def initialize(name)
    @name = name
    @projects = []
    @pledges = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.highest_pledge
    @@all.max {|a, b| a.pledges.pledge <=> b.pledges.pledge}
  end

  def self.multi_pledger
    @@all.select {|user| user.pledges > 1}
  end

  def self.project_creator
    @@all.select {|user| user.projects.size > 0}
  end

  def find_project_by_name(name)
    Project.all.find {|projects| projects.name == name}
  end

  def add_pledge(pledge, pledge_project)
    if self.find_project_by_name(pledge_project) == nil
      "Missing project data. Please choose a project or create one."
    else
      new_pledge = Pledge.new(pledge, self, pledge_project)
      @pledges << new_pledge
      new_pledge
    end
  end

  def add_project(project_name, goal)
    new_project = Project.new(project_name, goal)
    @projects << new_project
    Project.all << new_project
    new_project
  end

end
