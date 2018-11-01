class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    name.tr(' ', '-').downcase
  end

  def self.find_by_slug(slug_name)
    Genre.all.find do |genre|
      genre.slug == slug_name
    end
  end
end
