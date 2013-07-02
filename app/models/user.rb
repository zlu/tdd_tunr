# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_and_belongs_to_many :albums

  validates :name, presence: true
  validates :email, presence: true

  def purchase(album)
    unless album.in? self.albums
      self.albums << album
    end
  end
end
