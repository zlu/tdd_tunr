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
    it 'requires a name'
  end

  describe 'association' do
    it 'has an artist' do
      expect(subject).to respond_to :artist
    end

    it 'has an album' do
      expect(subject).to respond_to :album
    end
  end
end
