class Song
    attr_accessor :name, :artist, :genre
  
    @@count = 0
    @@genres = []
    @@artists = []
  
    def initialize(name, artist, genre)
      @name = name
      @artist = artist
      @genre = genre
      @@count += 1
      @@genres << genre
      @@artists << artist
    end
  
    def self.count
      @@count
    end
  
    def self.genres
      @@genres.uniq
    end
  
    def self.artists
      @@artists.uniq
    end
  
    def self.genre_count
      genre_histogram = Hash.new(0)
      @@genres.each { |genre| genre_histogram[genre] += 1 }
      genre_histogram
    end
  
    def self.artist_count
      artist_histogram = Hash.new(0)
      @@artists.each { |artist| artist_histogram[artist] += 1 }
      artist_histogram
    end
  end
  
  ninety_nine_problems = Song.new("99 Problems", "Jay-Z", "rap")
  
  puts ninety_nine_problems.name
  # Output: "99 Problems"
  
  puts ninety_nine_problems.artist
  # Output: "Jay-Z"
  
  puts ninety_nine_problems.genre
  # Output: "rap"
  
  puts Song.count
  # Output: 1
  
  puts Song.genres
  # Output: ["rap"]
  
  puts Song.artists
  # Output: ["Jay-Z"]
  
  puts Song.genre_count
  # Output: {"rap"=>1}
  
  puts Song.artist_count
  # Output: {"Jay-Z"=>1}
  
  describe Song do
    describe 'instance methods' do
      let!(:hit_me) { Song.new('hit me baby one more time', 'Britney Spears', 'pop') }
      
      describe '#initialize' do 
        it 'takes in three arguments: a name, artist, and genre' do 
          expect { Song.new('hit me baby one more time', 'Britney Spears', 'pop') }.not_to raise_error
        end
      end
  
      describe '#name' do 
        it 'returns the name' do 
          expect(hit_me.name).to eq('hit me baby one more time')
        end
      end
  
      describe '#artist' do 
        it 'returns the artist' do 
          expect(hit_me.artist).to eq('Britney Spears')
        end
      end
  
      describe '#genre' do 
        it 'returns the genre' do
          expect(hit_me.genre).to eq('pop') 
        end
      end
    end
  end
  