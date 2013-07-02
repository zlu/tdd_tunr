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

  describe 'validation' do
    it 'requires a name' do
      user.should be_valid
      user.name = nil
      user.should be_invalid
    end
    it 'requires an email' do
      user.should be_valid
      user.email = nil
      user.should be_invalid
    end
  end

  describe '#purchase' do
    let (:album) { create(:album) }

    context 'for new album' do
      it 'adds an album to collection' do
        lambda {
          user.purchase(album)
        }.should change{user.albums.size}.by(1)
        user.albums.should eq [album]
      end
    end

    context 'for existing album' do
      it 'does not add album to collection' do
        user.purchase(album)
        lambda {
          user.purchase(album)
        }.should change{user.albums.size}.by(0)
        user.albums.should eq [album]
      end
    end
  end
end
