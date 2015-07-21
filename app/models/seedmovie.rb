class Seedmovie < ActiveRecord::Base
  #These are movies in the seedmovies table loaded in the seeds.rb.
  #This table of movies is necessary for calculating the value
  #of each actor.

  has_and_belongs_to_many :actors
end
