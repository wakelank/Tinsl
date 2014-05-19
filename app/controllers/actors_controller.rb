class ActorsController < ApplicationController
  before_action:current_user

  def search
    actor = params[:search_term]
   # @results = Actor.where(name: params[:search_term])
   @results = Actor.where('name LIKE ?', "%#{ capitalize_phrase(actor) }%")
  end

  def save
    movie = Movie.find(params[:movie_id])
    actor = Actor.find(params[:id])
    movie.actors << actor

    redirect_to "/movies/#{ movie.id }/edit"
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    remove_actor = Actor.find(params[:id])
    movie.actors.delete(remove_actor)

    redirect_to "/movies/#{ movie.id }/edit"
  end
end