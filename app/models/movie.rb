class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.get_all_movies_by_director(id)
    m = self.find(id)
    dir = m.director
    if dir.blank?
      return {}
    end
    self.where(director: dir)
  end
end
