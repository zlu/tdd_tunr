class Song < ActiveRecord::Base
  attr_accessible :album_id, :artist_id, :name

  validates_presence_of :name

  belongs_to :artist
  belongs_to :album
end
