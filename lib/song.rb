require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize
    save
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    @@all << self.new 
    self.new 
  end 
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end 
  
  def self.create_by_name(song_name)
    song = self.create  
    song.name = song_name
    song 
  end
  
  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical 
    @@all.sort_by {|word| word.name} 
  end 
  
  
  def self.new_from_filename(filename)
    song = self.new
    
    words_array = filename.split(" - ")
    artist_name = words_array[0]
    song_name = words_array[1].gsub(".mp3","")

    song.artist_name = artist_name
    song.name = song_name
    song 
  end 
  
  def self.create_from_filename(filename)
    song = self.create 
    
    words_array = filename.split(" - ")
    artist_name = words_array[0]
    song_name = words_array[1].gsub(".mp3","")

    song.artist_name = artist_name
    song.name = song_name
    song 
  end 
  
  def self.destroy_all
    self.all.clear
  end 

end
