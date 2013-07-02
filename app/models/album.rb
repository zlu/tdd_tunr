# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  img_url    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  attr_accessible :img_url, :name

  validates_presence_of :name, :img_url

  has_and_belongs_to_many :users
  has_many :songs
  has_many :artists, through: :songs
end
