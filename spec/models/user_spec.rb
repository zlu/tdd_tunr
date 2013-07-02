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

require 'spec_helper'

describe User do
  
  subject(:user) {User.create(name: 'zlu', email: 'zlu@foryogi.com')}

  describe '#purchase' do
  	context 'for new album' do
  	it 'adds an album to collection' do
  		album = create(:album)
  		lambda {
  			subject.purchase(album)
  		}.should change{user.albums.size}.by 1
  		user.albums.should eq [album]  		
  	end
  end

  context 'for existing album' do
  	it 'does not add album to collection'
  end
end
end
