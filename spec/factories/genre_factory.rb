# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :genre do
    id 1
    name Faker::Name.name
  end
  factory :genre2, class: Genre do
    id 2
    name Faker::Name.name
  end
end
