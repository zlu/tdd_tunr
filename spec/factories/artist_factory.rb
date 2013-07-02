# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :artist do
    id 1
    name Faker::Name.name
    url Faker::Internet.url
  end
  factory :artist2, class: Artist do
    id 2
    name Faker::Name.name
    url Faker::Internet.url
  end
end
