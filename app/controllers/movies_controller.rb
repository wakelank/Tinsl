class MoviesController < ApplicationController
  before_action :authorize


      def index
        @movies = current_user.movies

      end

      def create
        new_movie = Movie.create(movie_params)
        current_user.movies << new_movie

        redirect_to "/movies/#{ new_movie.id }/edit"
      end

      def new
        if (params[:gen_title])

            @title = generate_title
        else
          @title = ""
        end

      end

      def edit
        @movie = Movie.find(params[:id])
        if (params[:gen_title])

            @title = generate_title
        else
          @title = @movie.title
        end



      end

      def show
        @movie = Movie.find(params[:id])
      end

      def update
        edit_movie = Movie.find(params[:id])
        edit_movie.update(movie_params)

        redirect_to "/movies/#{ edit_movie.id }/edit"
      end

      def destroy
        Movie.delete(params[:id])

        redirect_to '/movies'

      end

      def generate_title
        adj_url="http://api.wordnik.com:80/v4/words.json/randomWords?hasDictionaryDef=false&includePartOfSpeech=adjective&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&limit=1&api_key="
        noun_url="http://api.wordnik.com:80/v4/words.json/randomWords?hasDictionaryDef=false&includePartOfSpeech=noun&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&limit=1&api_key="
        key=ENV.fetch('WORDNIK_KEY')

        adj_response = HTTParty.get(adj_url + key)
        adj = adj_response[0]["word"]
        noun_response = HTTParty.get(noun_url + key)
        noun = noun_response[0]["word"]

        capitalize_phrase(title = "The " + adj + " " + noun)


      end



      private
      def movie_params
        movie_params = params.require(:movie).permit(:title, :tagline)
      end

end
