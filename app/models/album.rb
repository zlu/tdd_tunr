class Album < ActiveRecord::Base
  attr_accessible :img_url, :name

  validates_presence_of :name, :img_url

  has_and_belongs_to_many :users
end
