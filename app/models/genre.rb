class Genre
  
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

  def self.find_by_name(name)
    @@genres.find do |element|
      element.name == name 
    end
  end

  def self.create_by_name(name)
    self.new.tap{|song| song.name = name}
  end

end