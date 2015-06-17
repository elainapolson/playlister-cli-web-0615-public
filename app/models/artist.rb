class Artist

  attr_accessor :name, :song, :songs, :genres

  @@all = []
  
  def initialize
    @@all << self
    @songs = []
    @genres = []
  end

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end


  def add_song(song)
    self.songs << song
    if song.genre 
      self.genres << song.genre
      if !song.genre.artists.include?(self)
        song.genre.artists << self
      end
    end
  end

  def add_songs(songs)
    songs.each do |song|
      self.add_song(song)
    end
  end

  def self.find_by_name(name)
    @@all.find do |element|
      element.name == name 
    end
  end

  def self.create_by_name(name)
    self.new.tap{|artist| artist.name = name}
  end


end