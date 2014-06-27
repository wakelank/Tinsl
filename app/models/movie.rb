class Movie < ActiveRecord::Base
  #has_and_belongs_to_many :actors
  belongs_to :user

  has_many :actors_movies
  has_many :actors, :through => :actors_movies

  def get_total_gross # You mean the 'Ew' factor?
    total = 0
    self.actors.each do |actor|
      total += actor.value
    end
    total
  end

  # Dang that's a long method. I'd create a class called 'MovieRanking'
  # the only responsibility of which is to do THIS.
  def ranking
    ranking = {}
    rank = 0
    arr = []

    Seedmovie.all.each do |movie|
      arr << movie
    end
    arr.sort! {|x, y| y[:gross] <=> x[:gross] }

    arr.each do |movie|
      if self.get_total_gross > movie.gross
        rank = arr.index(movie)+1
        break
      end
    end
    if rank == 0
      one_higher_title = ""
      one_higher_rank = ""
      one_lower_rank = ""
      one_lower_title = ""
    elsif rank == 1
      one_higher_title = ""
      one_higher_rank = ""
      one_lower_title = arr[rank].title
      one_lower_rank = "#" + (rank + 1).to_s
      # elsif rank == 0
      #   one_higher_title = arr[rank].title
      #   one_higher_rank = "#" + (rank).to_s
      #   one_lower_rank = ""
      #   one_lower_title = ""
    else
      one_higher_title = arr[rank - 2].title
      one_higher_rank = "#" + (rank-1).to_s + ": "
      one_lower_title = arr[rank-1].title
      one_lower_rank = "#" + (rank + 1).to_s + ": "
    end

    #one_lower = arr[rank].title
    ranking = { :rank => "#" + (rank).to_s,
               :one_higher_title => one_higher_title,
               :one_lower_title => one_lower_title,
               :one_higher_rank => one_higher_rank,
               :one_lower_rank => one_lower_rank.to_s  }
  end

  # def get_seedmovie(rank)
  #   arr = make_seedmovie_array
  #   arr[rank - 1]

  # end

  # def make_seedmovie_array
  #   arr=[]
  #   Seedmovie.all.each do |movie|
  #     arr << movie
  #   end
  #   arr.sort! { |x,y| y <=> x}
  #   arr
  # end

end
