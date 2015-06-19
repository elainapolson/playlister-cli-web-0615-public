class Genre
  
  extend Findable::ClassMethods
  extend Createable::ClassMethods
  extend Memorable::ClassMethods

  attr_accessor :name, :songs, :artists, :artist 

  @@genres = []
  
  def initialize
    @@genres << self
    @songs = []
    @artists = []
  end

  def self.all
    @@genres
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

end