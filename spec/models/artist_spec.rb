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

require 'spec_helper'

describe Artist do
  subject(:artist) {build(:artist)}

  describe 'validation' do
    it 'requires a name' do
      expect(artist).to be_valid
      artist.name = nil
      expect(artist).to be_invalid
    end

    it 'requires a url' do
      expect(artist).to be_valid
      artist.url = nil
      expect(artist).to be_invalid
    end
  end

  describe 'associations' do

    context 'has many songs' do
      let(:song){ build(:song) }
      let(:song2){ build(:song2) }
      it 'knows owning songs' do
        expect(subject).to respond_to(:songs)
      end
      it 'can have one song' do
        lambda {
          artist.songs << song
        }.should change{artist.songs.size}.from(0).to(1)
        artist.songs.should eq [song]
      end
      it 'can have multiple songs' do
        artist.songs << song
        lambda {
          artist.songs << song2
        }.should change{artist.songs.size}.from(1).to(2)
        artist.songs.should eq [song, song2]
      end
    end
  end
end
