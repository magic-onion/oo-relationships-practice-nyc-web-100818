class User

  attr_reader :project, :pledge, :name, :pledges

  @@all = []

  def initialize(name)
    @name = name
    @projects = []
    @pledges = []
  end

  self.all
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

  def add_pledge(pledge, project)
    if project.name == project
        new_pledge = Pledge.new(pledge, self, project)
        project.users << self
        @pledges << new_pledge
        new_pledge
    else
      "That project does not exist. Would you like to make one?"
    end
  end

  def add_project(project_name, goal)
    new_project = Project.new(project_name)
    self.projects << new_project
    new_project
  end

end
