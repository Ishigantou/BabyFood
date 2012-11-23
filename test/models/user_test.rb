# coding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe '#baby_stage' do
    subject{ user.baby_stage }
    describe 'when baby is first stage' do
      let(:user){ Fabricate(:user, baby_birthday: (6.months.ago + 1.day).to_date) }
      it{ subject.must_equal '離乳食 初期（5〜6ヶ月）' }
    end

    describe 'when baby is second stage (youngest)' do
      let(:user){ Fabricate(:user, baby_birthday: 6.months.ago.to_date) }
      it{ subject.must_equal '離乳食 中期（7〜8ヶ月）' }
    end

    describe 'when baby is second stage (oldest)' do
      let(:user){ Fabricate(:user, baby_birthday: (8.months.ago + 1.day).to_date) }
      it{ subject.must_equal '離乳食 中期（7〜8ヶ月）' }
    end

    describe 'when baby is first stage' do
      let(:user){ Fabricate(:user, baby_birthday: 8.months.ago.to_date) }
      it{ subject.must_equal '離乳食 後期（9〜11ヶ月）' }
    end
  end
end
