class Song

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

  def self.find_by_name(name)
    @@songs.find do |element|
      element.name == name 
    end
  end

  def self.create_by_name(name)
    self.new.tap{|song| song.name = name}
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