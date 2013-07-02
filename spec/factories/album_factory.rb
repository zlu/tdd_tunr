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

FactoryGirl.define do
  factory :album do
    id 1
    name Faker::Name.name
    img_url Faker::Internet.url
  end
  factory :album2, class: Album do
    id 2
    name Faker::Name.name
    img_url Faker::Internet.url
  end
end
