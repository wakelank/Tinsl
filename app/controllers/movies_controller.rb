class MoviesController < ApplicationController
  before_action:current_user

      #   movies GET    /new_movievies(.:format)                           movies#index
      #            POST   /movies(.:format)                           movies#create
      #  new_movie GET    /movies/new(.:format)                       movies#new
      # edit_movie GET    /movies/:id/edit(.:format)                  movies#edit
      #      movie GET    /movies/:id(.:format)                       movies#show
      #            PATCH  /movies/:id(.:format)                       movies#update
      #            PUT    /movies/:id(.:format)                       movies#update
      #            DELETE /movies/:id(.:format)                       movies#destroy                                           

      def index
        @movies = current_user.movies
        
      end

      def create
        new_movie = Movie.create(movie_params)
        current_user.movies << new_movie

        redirect_to "/movies/#{ new_movie.id }/edit"
      end

      def new

      end

      def edit
        @movie = Movie.find(params[:id])
        if (params[:gen_title])
          #@title = "The " + RandomWord.adjs.next + " " + RandomWord.nouns.next
          #@title = @title.gsub('_', ' ')

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

      private
      def movie_params
        movie_params = params.require(:movie).permit(:title, :tagline)
      end

end
