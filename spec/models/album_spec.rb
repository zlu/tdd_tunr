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

require 'spec_helper'

describe Album do
	subject(:album) {build(:album)}

	describe 'validation' do
		it 'requires a name' do
			expect(album).to be_valid
			album.name = nil
			expect(album).to be_invalid
		end

		it 'requires an img_url' do
			expect(album).to be_valid
			album.img_url = nil
			expect(album).to be_invalid
		end
	end

	describe 'associations' do
		context 'has many users' do
			let(:user){ build(:user) }
			let(:user2){ build(:user2) }
			it 'knows owning users' do
				expect(subject).to respond_to(:users)
			end
			it 'can have one user' do
				lambda {
					album.users << user
				}.should change{album.users.size}.from(0).to(1)
				album.users.should eq [user]
			end
			it 'can have multiple users' do
				album.users << user
				lambda {
					album.users << user2
				}.should change{album.users.size}.from(1).to(2)
				album.users.should eq [user, user2]
			end
		end

		context 'has many songs' do
			let(:song){ build(:song) }
			let(:song2){ build(:song2) }
			it 'knows owning songs' do
				expect(subject).to respond_to(:songs)
			end
			it 'can have one song' do
				lambda {
					album.songs << song
				}.should change{album.songs.size}.from(0).to(1)
				album.songs.should eq [song]
			end
			it 'can have multiple songs' do
				album.songs << song
				lambda {
					album.songs << song2
				}.should change{album.songs.size}.from(1).to(2)
				album.songs.should eq [song, song2]
			end
		end
	end
end
