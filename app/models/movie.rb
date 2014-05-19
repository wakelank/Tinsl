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

  def generate_title
    title = "The " + RandomWord.adjs.next + " " + RandomWord.nouns.next
    title.gsub("_", " ")
    title.split.map(&:capitalize).join(' ')
  end

end
