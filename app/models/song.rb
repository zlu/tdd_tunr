# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  album_id   :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ActiveRecord::Base
  attr_accessible :album_id, :artist_id, :name

  validates_presence_of :name

  belongs_to :artist
  belongs_to :album
  belongs_to :genre
end
