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

require 'spec_helper'

describe Song do

  subject(:song) {create(:song, name: 'overridding name')}

  describe 'validation' do
    it 'requires a name' do
      expect(song).to be_valid
      song.name = nil
      expect(song).to be_invalid
    end
  end

  describe 'association' do
    context 'belongs to an artist' do
      it 'knows belonging to artist' do
        expect(song).to respond_to :artist
      end
      it 'belongs to an artist' do
        artist = build(:artist)
        song.artist = artist
        expect(song.artist).to be artist
      end
    end

    context 'belongs to an album' do
      it 'knows belonging to album' do
        expect(song).to respond_to :album
      end
      it 'belongs to an album' do
        album = build(:album)
        song.album = album
        expect(song.album).to be album
      end
    end

    context 'belongs to a genre' do
      it 'knows belonging to genre' do
        expect(song).to respond_to :genre
      end
      it 'belongs to an genre' do
        genre = build(:genre)
        song.genre = genre
        expect(song.genre).to be genre
      end
    end
  end
end
