class Song

  extend Findable::ClassMethods
  extend Createable::ClassMethods
  extend Memorable::ClassMethods

  attr_accessor :name, :genre, :artist

  @@songs = []

  def initialize
    @@songs << self
  end

  def self.all
    @@songs
  end

  def self.count
    self.all.count
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def self.reset_all
    self.all.clear
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

end