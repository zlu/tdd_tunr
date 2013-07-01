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

  	it 'has an album'
  end
end
