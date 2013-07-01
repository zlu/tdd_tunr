FactoryGirl.define do
	factory :album do
		id 1
		name 'cocktail'
		img_url 'http://cocktail.com'
	end

	factory :artist do
		id 1
		name Faker::Name.name
	end

	factory :song do
		id 1
		artist
		album
		name Faker::Name.name
	end
end