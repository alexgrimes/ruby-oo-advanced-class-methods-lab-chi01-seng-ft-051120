require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new 
    @@all << song 
    song
  end 
  

  def self.new_by_name(name)
    song = Song.new 
    song.name = name 
    song 
  end 

  def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    @@all << song 
    song 
  end 

  #finds song names in the class
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
      #binding.pry
    end 
  end 

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #binding.pry
  end

  def save
    self.class.all << self
  end
  #binding.pry

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(filename)
    parts = filename.split(' - ')
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
    #binding.pry
  end 

  def self.create_from_filename(filename)
    parts = filename.split(' - ')
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
    song 
  end 

  def self.destroy_all
    self.all.clear
  end 
end



