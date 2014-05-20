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

  def get_rank
    rank=0
    arr=[]
    Seedmovie.all.each do |movie|
      arr << movie.gross
    end

    arr.sort! { |x,y| y <=> x}
    arr.each do |x|
      break if self.get_total_gross > x
      rank = arr.index(x)+1
    end
    rank


  end

end
