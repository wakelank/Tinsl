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



end
