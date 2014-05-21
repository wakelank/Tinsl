class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  belongs_to :user

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
        rank = arr.index(movie)
        break
      end
    end
    one_higher = arr[rank - 1].title
    one_lower = arr[rank].title
    ranking = { :rank => rank, :one_higher => one_higher, :one_lower => one_lower }
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
