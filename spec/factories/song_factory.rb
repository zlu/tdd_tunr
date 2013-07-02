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

FactoryGirl.define do
  factory :song do
    id 1
    artist
    album
    name Faker::Name.name
  end
end
