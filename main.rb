=begin
   This is my first ruby program.
   It is a simple program that will collect
   data about movies I have watched.
   Every movie has a title, genre and rating
   from 1 to 10.
=end

module Movie_list
   $my_movies = [] # this array holds all the movie objects

   class Movie
      #
      # This is the class for creating
      # movie objects. Every object holds
      # one movie title, the genre and rating.
      # Every movie object is automaticly added
      # to the my_movie array.
      #
      @@no_of_movies = 0
      def initialize(title, genre, rating)
         @title = title
         @genre = genre
         @rating = rating
         @@no_of_movies += 1
         $my_movies.push(self)
      end

      def to_s
         "Title: #@title\nGenre: #@genre\nRating: #{@rating}/10"
      end

      attr_accessor :title, :genre, :rating
   end

   def show_movie_list
      # this method will show all the movies added
      puts "======= ALL MY MOVIES ======="

      $my_movies.each do |element|
         puts element.title
      end
      puts
   end

   def sort_list(sort_by)
      puts "======= MY MOVIES SORTED BT #{sort_by.upcase} ======="

      case sort_by
      when "title"
         sorted_array = $my_movies.sort do |a,b|
            a.title.downcase <=> b.title.downcase
         end
      when "genre"
         sorted_array = $my_movies.sort do |a,b|
            a.genre.downcase <=> b.genre.downcase
         end
      when "rating"
         sorted_array = $my_movies.sort do |a,b|
            b.rating <=> a.rating
         end
      else
         puts "wrong category"
      end
      sorted_array.each {|x| puts x.title}
   end
   puts
end

include Movie_list

legend = Movie_list::Movie.new("Legend", "drama", 7)
the_shining = Movie_list::Movie.new("The Shining", "thriller", 8)
interstellar = Movie_list::Movie.new("Interstellar", "drama", 9)
lord_of_the_rings_1 = Movie_list::Movie.new("The Lord of the Rings - Fellowship of the ring", "fantasy", 10)
apollo_13 = Movie_list::Movie.new("Apollo 13", "sci-fi", 8)

Movie_list.show_movie_list

Movie_list.sort_list("rating")

=begin
sort_array = $my_movies.sort { |a,b| a.title.downcase <=> b.title.downcase}
sort_array.each {|x| puts x.title}
=end
