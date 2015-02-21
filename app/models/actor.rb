class Actor < ActiveRecord::Base
  # has_and_belongs_to_many :movies
  has_many :actors_movies
  has_many :movies, :through => :actors_movies
  has_and_belongs_to_many :seedmovies

  def get_image
    return self.image_url if self.image_url

    base_url = "http://private-e8bc0-themoviedb.apiary-proxy.com/3/search/person?api_key="
    key = ENV.fetch('TMDB_KEY')
    search = self.name.gsub!(" ","+")
    url = base_url + key + "&query=" + search
    results = HTTParty.get(url)
    profile_path = results["results"][0]["profile_path"]
    self.image_url = "http://image.tmdb.org/t/p/w500" + profile_path
    self.save
    self.image_url
  end

end
