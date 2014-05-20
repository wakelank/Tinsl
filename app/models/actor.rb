class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies
  has_and_belongs_to_many :seedmovies

  def get_image
    if self.image_url.nil?
      base_url="http://private-e8bc0-themoviedb.apiary-proxy.com/3/search/person?api_key="
      key=ENV.fetch('TMDB_KEY')
      search = self.name.gsub!(" ","+")
      url = base_url + key + "&query=" + search
      results = HTTParty.get(url)
      profile_path=results["results"][0]["profile_path"]
      self.image_url = "http://image.tmdb.org/t/p/w500" + profile_path
      self.save
    end
    self.image_url
  end

end