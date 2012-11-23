require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  describe '.day' do
    before{ @menu = Fabricate(:menu, created_at: Time.new(2012, 11, 23)) }
    subject{ Menu.day(searching_date) }
    describe 'empty day' do
      let(:searching_date){ Date.new(2012, 11, 22) }
      it{ subject.must_be_empty }
    end
    describe 'created day' do
      let(:searching_date){ Date.new(2012, 11, 23) }
      it{ subject.must_equal [@menu] }
    end
  end

  describe '#day_path' do
    let(:datetime){ Time.new(2012, 11, 23) }
    subject{ Fabricate(:menu, created_at: datetime) }
    it do
      subject.day_path.must_equal '/menus/2012/11/23'
    end
  end

  describe '#today?' do
    subject{ Fabricate(:menu, created_at: Time.now) }
    it do
      subject.today?.must_equal true
    end
  end
end
