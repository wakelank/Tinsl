class Movie < ActiveRecord::Base
  #has_and_belongs_to_many :actors
  belongs_to :user

  has_many :actors_movies
  has_many :actors, :through => :actors_movies

  def get_total_gross
    total = 0
    self.actors.each do |actor|
      total += actor.value
    end
    total
  end

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

end
