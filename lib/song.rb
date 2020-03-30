class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name_mp3 = data[1].split(".")
    song_name_no_mp3 = song_name_mp3[0]
 
    song = self.new 
    song.artist_name = artist_name
    song.name = song_name_no_mp3
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.destroy_all
    @@all.clear
  end

end