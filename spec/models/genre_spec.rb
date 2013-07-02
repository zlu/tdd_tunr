# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Genre do
  subject(:genre) {build(:genre)}

  describe 'validation' do
    it 'requires a name' do
      expect(genre).to be_valid
      genre.name = nil
      expect(genre).to be_invalid
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
          genre.songs << song
        }.should change{genre.songs.size}.from(0).to(1)
        genre.songs.should eq [song]
      end
      it 'can have multiple songs' do
        genre.songs << song
        lambda {
          genre.songs << song2
        }.should change{genre.songs.size}.from(1).to(2)
        genre.songs.should eq [song, song2]
      end
    end
  end
end
