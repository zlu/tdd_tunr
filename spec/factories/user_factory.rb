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

FactoryGirl.define do
  factory :user do
    id 1
    name Faker::Name.name
    email Faker::Internet.email
  end

  factory :user2, class: User do
    id 2
    name Faker::Name.name
    email Faker::Internet.email
  end
end
