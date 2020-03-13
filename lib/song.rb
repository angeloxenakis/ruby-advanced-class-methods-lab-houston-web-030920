require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all()
    @@all
  end

  def save()
    self.class.all << self
  end

  def self.create()
    object_instance = self.new()
    @@all.push(object_instance)
    return object_instance
  end

  def self.new_by_name(song_name)
    object_instance = self.new()
    object_instance.name = song_name
    return object_instance
  end 

  def self.create_by_name(song_name)
    object_instance = self.new()
    object_instance.name = song_name
    @@all.push(object_instance)
    return object_instance
  end 

  def self.find_by_name(find_name)
    @@all.each do |song|
      if find_name == song.name
        return song
      end 
    end 
    return nil
  end 

  def self.find_or_create_by_name(name_input)
    if !self.find_by_name(name_input)
      self.create_by_name(name_input)
    else 
      self.find_by_name(name_input)
    end
  end 

  def self.alphabetical()
    @@all.sort_by {|song| song.name }
  end 

  def self.new_from_filename(song_file)
    song_file = song_file.split(/[-.]/)
    name = song_file[1].strip
    artist = song_file[0].strip
    object_instance = self.new_by_name(name)
    object_instance.artist_name = artist
    return object_instance
  end 

  def self.create_from_filename(song_file)
    song_file = song_file.split(/[-.]/)
    name = song_file[1].strip
    artist = song_file[0].strip
    object_instance = self.new_by_name(name)
    object_instance.artist_name = artist
    @@all.push(object_instance)
    return object_instance
  end 

  def self.destroy_all()
    @@all = []
  end 
end
