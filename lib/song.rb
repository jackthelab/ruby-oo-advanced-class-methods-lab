class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all.push(song)
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    if @@all.map{ | song | song.name }.include?(name) != true

      song = self.new
      song.name = name
      @@all.push(song)
      return song
      
    end 
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    #need to call class methods in a class method
    # if self.find_by_name(name) == false
    #   self.create_by_name(name)
    # else
    #   self.find_by_name(name)
    # end

    self.create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    end

    #NEEDS WORK BUT I THINK IT COULD BE THE TEST... THIS IS ALL SCREWED UP...
    #LOOK AT BELOW CODE FOR WHAT I ACTUALLY THINK IS BEST
    #

    # if self.find_by_name(name) == false
    #   self.create_by_name(name)
    # else
    #   self.find_by_name(name)
    # end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name)
    title_artist = name.split(".mp3")[0].split(" - ")
    song = self.new

    song.artist_name = title_artist[0]
    song.name = title_artist[1]

    return song
  end

  def self.create_from_filename(name)
    title_artist = name.split(".mp3")[0].split(" - ")
    song = self.new
    
    song.artist_name = title_artist[0]
    song.name = title_artist[1]

    @@all.push(song)

    return song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
