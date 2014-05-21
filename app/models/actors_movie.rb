class ActorsMovie < ActiveRecord::Base
  belongs_to :actor 
  belongs_to :movie 

  validates :movie_id, uniqueness: {scope: :actor_id}
  validates :actor_id, uniqueness: {scope: :movie_id}

end
