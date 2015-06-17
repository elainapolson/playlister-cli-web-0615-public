class LibraryParser

  def initialize(path = "db/data")
    @path = path
  end

  def files
    @files = Dir.entries(@path)[2..-1]
  end
  
  def call
    self.files.each do |filename|
      parts = parse_filename(filename)
      build_song(parts[0], parts[1], parts[2])
    end
  end 

  def parse_filename(filename)
    artist_name = filename.split(" - ").first.strip
    song_name = filename.split(" - ").last.split(" [").first.strip
    genre = filename.split(" - ").last.split(" [").last.gsub("].mp3", "").strip

    [artist_name, song_name, genre]
  end

  def build_song(artist_name, song_name, genre_name)
    Song.create_by_name(song_name).tap do |s|
      s.artist = Artist.create_by_name(artist_name)
      s.genre = Genre.create_by_name(genre_name)
    end
  end

end