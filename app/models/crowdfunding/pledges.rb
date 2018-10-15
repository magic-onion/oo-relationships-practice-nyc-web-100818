class Pledge

  @@all = []

  attr_accessor :user, :project, :pledge

  def initialize(pledge, user, project)
    @pledge = pledge
    @user = user
    @project = project
    @@all << self
  end

  def self.all
    @@all
  end


end
